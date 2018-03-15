require 'celluloid'
require_relative 'evento'

class Lote

    include Celluloid

    def initialize(nome_lote)
        @nome_lote = nome_lote
        p "Criando - #{nome_lote}"
    end

    def criar_eventos_do_lote
        @eventos = []

        array_eventos = Array[
            "#{@nome_lote} -> Evento S-#{rand(35)}",
            "#{@nome_lote} -> Evento S-#{rand(25)}",
            "#{@nome_lote} -> Evento S-#{rand(45)}",
            "#{@nome_lote} -> Evento S-#{rand(52)}"
        ]

        array_eventos.each do |nome_evento|
            e = Evento.new nome_evento
            @eventos << e
            p "#{nome_evento} criado!" 
        end
        
        processar_eventos_do_lote
        
    end

    def processar_eventos_do_lote
        @eventos.each do |evento|
            p "Criando ações do #{evento.nome_evento}"
            evento.async.criar_acoes Actor.current
        end
    end

    def verificar_se_ainda_tem_eventos
        @eventos.each do |evento|
            evento.acoes.each do |acao|
                if acao.em_uso?
                    acao.finalizar
                end
            end
        end  
    end

    def status
        p "#{@nome_lote}"
        p "Total de Eventos: #{@eventos.size}"
        @eventos.each do |evento|
            p "Total de Açoes: #{evento.acoes.size} "
        end
    end
end