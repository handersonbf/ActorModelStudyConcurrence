require 'celluloid'
require_relative 'acao_evento'

class Evento

    include Celluloid
    
    attr_accessor :acoes, :nome_evento

    def initialize(nome_evento)
        @nome_evento = nome_evento
        @acoes = []
    end
    
    def criar_acoes(actor_lote)
        @actor_lote = actor_lote

        p "[#{@nome_evento}] sendo processado!"
    
        @acoes = Array[
            AcaoEvento.new("Ação: #{@nome_evento}->#{rand(10)}"), 
            AcaoEvento.new("Ação: #{@nome_evento}->#{rand(15)}"), 
            AcaoEvento.new("Ação: #{@nome_evento}->#{rand(40)}") 
        ]

        processar_acoes
    end

    def processar_acoes
        @acoes.each do |acao|
            acao.iniciar
        end

        @actor_lote.async.verificar_se_ainda_tem_eventos
    end

end