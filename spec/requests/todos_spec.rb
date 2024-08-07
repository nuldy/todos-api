require 'rails_helper'

RSpec.describe "Todos", type: :request do
  describe "GET /todos" do
    it "returns a list of todos" do
      get "/todos"
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  describe "GET /todos/:id" do
    it "returns a todo item" do
      get "/todos/1"
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)["id"]).to eq(1)
    end
  end



  # << Not working because the project doesn't have a database >>
  describe "POST /todos" do
    it "creates a new todo item" do
      post "/todos", params: { id: 3, title: "New To do" }
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)["title"]).to eq("New To do")
    end
  end

  describe "PUT /todos/:id" do
    it "updates a todo item" do
      put "/todos/1", params: { title: "Updated Todo" }
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)["title"]).to eq("Updated To do")
    end
  end

  describe "DELETE /todos/:id" do
    it "deletes a todo item" do
      delete "/todos/1"
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)["message"]).to eq("To do deleted")
    end
  end
end
