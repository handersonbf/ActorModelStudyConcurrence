require_relative 'lote'
class Iniciar

    def initialize
        p "Iniciando............ Started At #{Time.now}"
       
        thread = 2.times do |x| 
            Thread.new {
                p x
                lote = Lote.new "Lote N: #{rand(29)}"
                lote.criar_eventos_do_lote
            }
        end

        # sleep 
        
    end

    
end

Iniciar.new
