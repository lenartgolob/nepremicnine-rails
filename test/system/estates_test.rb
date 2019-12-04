require "application_system_test_case"

class EstatesTest < ApplicationSystemTestCase
  setup do
    @estate = estates(:one)
  end

  test "visiting the index" do
    visit estates_url
    assert_selector "h1", text: "Estates"
  end

  test "creating a Estate" do
    visit estates_url
    click_on "New Estate"

    fill_in "Cena", with: @estate.cena
    fill_in "Lokacija", with: @estate.lokacija
    fill_in "Naslov", with: @estate.naslov
    fill_in "Objava", with: @estate.objava
    fill_in "Opis1", with: @estate.opis1
    fill_in "Opis2", with: @estate.opis2
    fill_in "Parcela", with: @estate.parcela
    fill_in "Posredovanje", with: @estate.posredovanje
    fill_in "Telefon", with: @estate.telefon
    fill_in "Tip", with: @estate.tip
    fill_in "User", with: @estate.user_id
    fill_in "Velikost", with: @estate.velikost
    fill_in "Vrsta", with: @estate.vrsta
    click_on "Create Estate"

    assert_text "Estate was successfully created"
    click_on "Back"
  end

  test "updating a Estate" do
    visit estates_url
    click_on "Edit", match: :first

    fill_in "Cena", with: @estate.cena
    fill_in "Lokacija", with: @estate.lokacija
    fill_in "Naslov", with: @estate.naslov
    fill_in "Objava", with: @estate.objava
    fill_in "Opis1", with: @estate.opis1
    fill_in "Opis2", with: @estate.opis2
    fill_in "Parcela", with: @estate.parcela
    fill_in "Posredovanje", with: @estate.posredovanje
    fill_in "Telefon", with: @estate.telefon
    fill_in "Tip", with: @estate.tip
    fill_in "User", with: @estate.user_id
    fill_in "Velikost", with: @estate.velikost
    fill_in "Vrsta", with: @estate.vrsta
    click_on "Update Estate"

    assert_text "Estate was successfully updated"
    click_on "Back"
  end

  test "destroying a Estate" do
    visit estates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Estate was successfully destroyed"
  end
end
