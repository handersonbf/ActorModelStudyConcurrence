require 'celluloid'

class AcaoEvento

    include Celluloid

    def initialize(nome_evento)
        @nome_evento = nome_evento
        @mutex = Mutex.new
    end

    def nome_evento
        @nome_evento
    end

    def iniciar
        p "LOCKANDO: #{@nome_evento} Started At #{Time.now}"
        @mutex.lock
    end

    def finalizar
        p "DESALOCKANDO:  #{@nome_evento} END #{Time.now}"
        @mutex.unlock
        rescue ThreadError
    end

    def em_uso?
        @mutex.locked?
    end

end