#!/usr/bin/env ruby
require 'open-uri'
require 'fileutils'

# Find all markdown files with Wikipedia image URLs
image_map = {}
counter = 0

Dir.glob('contents/vi/**/*.md').each do |file|
  content = File.read(file)
  chapter = file.match(/chapter(\d+)/)[1] rescue nil
  next unless chapter
  
  # Find all Wikipedia image URLs
  content.scan(/!\[(.*?)\]\((https:\/\/upload\.wikimedia\.org\/.*?)\)/).each do |alt_text, url|
    counter += 1
    
    # Extract file extension from URL
    ext = File.extname(URI.parse(url).path)
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
      local_path: local_path,
      file: file,
      alt_text: alt_text
    }
  end
end

puts "Found #{image_map.size} images to download"

# Download all images
image_map.each_with_index do |(url, info), index|
  puts "[#{index + 1}/#{image_map.size}] Downloading: #{url}"
  
  begin
    URI.open(url) do |image|
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
image_map.each do |url, info|
  file = info[:file]
  local_path = info[:local_path]
  alt_text = info[:alt_text]
  
  # Calculate relative path from markdown file to image
  # Markdown files are in contents/vi/chapterXX/_posts/
  # Images are in img/chapter_img/chapterXX/
  relative_path = "/#{local_path}"
  
  content = File.read(file)
  old_line = "![#{alt_text}](#{url})"
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
