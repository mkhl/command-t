module CommandT
  class Scanner
    class FileScanner
      class CompositeFileScanner
        def initialize(scanners)
          @scanners = scanners
        end

        def paths
          @scanners.each do |scanner|
            begin
              return scanner.paths
            rescue RuntimeError, Errno::ENOENT
              next
            end
          end
        end

        def path=(path)
          @scanners.each do |scanner|
            scanner.path = path
          end
        end

        def flush
          @scanners.each do |scanner|
            scanner.flush
          end
        end
      end
    end
  end
end
