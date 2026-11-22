#!/usr/bin/env ruby
require 'open-uri'
require 'fileutils'

# Map of failed URLs to their original versions (without /thumb/ and size specifications)
failed_urls = {
  'https://upload.wikimedia.org/wikipedia/commons/9/9e/Black_hole_-_Messier_87.png' => 'https://upload.wikimedia.org/wikipedia/commons/9/9e/Black_hole_-_Messier_87.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Pizza_slice_folded.png/640px-Pizza_slice_folded.png' => 'https://upload.wikimedia.org/wikipedia/commons/d/da/Pizza_slice_folded.png',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Minkowski_curvature.gif/400px-Minkowski_curvature.gif' => 'https://upload.wikimedia.org/wikipedia/commons/e/ec/Minkowski_curvature.gif',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b3/Great_Circle_Flight_Path.svg/640px-Great_Circle_Flight_Path.svg.png' => 'https://upload.wikimedia.org/wikipedia/commons/b/b3/Great_Circle_Flight_Path.svg',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Great_circle_hemispheres.png/640px-Great_circle_hemispheres.png' => 'https://upload.wikimedia.org/wikipedia/commons/c/cb/Great_circle_hemispheres.png',
  'https://upload.wikimedia.org/wikipedia/commons/f/f6/Catenoid_to_Helicoid_Transformation.gif' => 'https://upload.wikimedia.org/wikipedia/commons/f/f6/Catenoid_to_Helicoid_Transformation.gif',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Hairy_ball_theorem.jpg/640px-Hairy_ball_theorem.jpg' => 'https://upload.wikimedia.org/wikipedia/commons/b/b6/Hairy_ball_theorem.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8a/Hyperbolic_triangle_angle_sum.svg/400px-Hyperbolic_triangle_angle_sum.svg.png' => 'https://upload.wikimedia.org/wikipedia/commons/8/8a/Hyperbolic_triangle_angle_sum.svg'
}

# Find all markdown files and map failed URLs
image_map = {}
counter = 0

Dir.glob('contents/vi/**/*.md').each do |file|
  content = File.read(file)
  chapter = file.match(/chapter(\d+)/)[1] rescue nil
  next unless chapter
  
  # Find failed Wikipedia image URLs
  content.scan(/!\[(.*?)\]\((https:\/\/upload\.wikimedia\.org\/.*?)\)/).each do |alt_text, url|
    next unless failed_urls.key?(url)
    
    counter += 1
    new_url = failed_urls[url]
    
    # Extract file extension from new URL
    ext = File.extname(URI.parse(new_url).path)
    ext = '.jpg' if ext.empty?
    
    # Create a sanitized filename
    filename = alt_text.gsub(/[^a-zA-Z0-9\s]/, '').gsub(/\s+/, '_').downcase
    filename = "image_#{counter}" if filename.empty?
    filename = "#{filename}#{ext}"
    
    # Create chapter directory if it doesn't exist
    chapter_dir = "img/chapter_img/chapter#{chapter.rjust(2, '0')}"
    FileUtils.mkdir_p(chapter_dir)
    
    # Local path for the image
    local_path = "#{chapter_dir}/#{filename}"
    
    # Store mapping
    image_map[url] = {
      new_url: new_url,
      local_path: local_path,
      file: file,
      alt_text: alt_text
    }
  end
end

puts "Found #{image_map.size} failed images to retry"

# Download all images
image_map.each_with_index do |(old_url, info), index|
  puts "[#{index + 1}/#{image_map.size}] Downloading: #{info[:new_url]}"
  
  begin
    URI.open(info[:new_url]) do |image|
      File.open(info[:local_path], 'wb') do |file|
        file.write(image.read)
      end
    end
    puts "  ✓ Saved to: #{info[:local_path]}"
  rescue => e
    puts "  ✗ Error: #{e.message}"
  end
end

puts "\nUpdating markdown files..."

# Update all markdown files
files_updated = {}
image_map.each do |old_url, info|
  file = info[:file]
  local_path = info[:local_path]
  alt_text = info[:alt_text]
  
  # Calculate relative path from markdown file to image
  relative_path = "/#{local_path}"
  
  content = File.read(file)
  old_line = "![#{alt_text}](#{old_url})"
  new_line = "![#{alt_text}](#{relative_path})"
  
  if content.include?(old_line)
    content.gsub!(old_line, new_line)
    File.write(file, content)
    files_updated[file] = (files_updated[file] || 0) + 1
  end
end

puts "Updated #{files_updated.size} files:"
files_updated.each do |file, count|
  puts "  - #{file}: #{count} image(s)"
end

puts "\n✓ Done!"
