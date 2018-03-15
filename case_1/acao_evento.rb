require 'celluloid'

class AcaoEvento

    include Celluloid

    attr_accessor :nome_evento

    def initialize(nome_evento)
        @nome_evento = nome_evento
        @mutex = Mutex.new
    end

    def iniciar
        p "LOCKANDO: #{@nome_evento}"
        @mutex.lock
    end

    def finalizar
        p "DESALOCKANDO: #{@nome_evento}"
        @mutex.unlock
        rescue ThreadError
    end

    def em_uso?
        @mutex.locked?
    end

end