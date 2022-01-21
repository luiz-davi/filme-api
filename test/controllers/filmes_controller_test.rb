require "test_helper"

class FilmesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @filme = filmes(:one)
  end

  test "should get index" do
    get filmes_url, as: :json
    assert_response :success
  end

  test "should create filme" do
    assert_difference('Filme.count') do
      post filmes_url, params: { filme: { adicionado: @filme.adicionado, avaliacao: @filme.avaliacao, categoria: @filme.categoria, descricao: @filme.descricao, diretor: @filme.diretor, duracao: @filme.duracao, elenco: @filme.elenco, lancamento: @filme.lancamento, pais: @filme.pais, show_id: @filme.show_id, tipo: @filme.tipo, titulo: @filme.titulo } }, as: :json
    end

    assert_response 201
  end

  test "should show filme" do
    get filme_url(@filme), as: :json
    assert_response :success
  end

  test "should update filme" do
    patch filme_url(@filme), params: { filme: { adicionado: @filme.adicionado, avaliacao: @filme.avaliacao, categoria: @filme.categoria, descricao: @filme.descricao, diretor: @filme.diretor, duracao: @filme.duracao, elenco: @filme.elenco, lancamento: @filme.lancamento, pais: @filme.pais, show_id: @filme.show_id, tipo: @filme.tipo, titulo: @filme.titulo } }, as: :json
    assert_response 200
  end

  test "should destroy filme" do
    assert_difference('Filme.count', -1) do
      delete filme_url(@filme), as: :json
    end

    assert_response 204
  end
end
