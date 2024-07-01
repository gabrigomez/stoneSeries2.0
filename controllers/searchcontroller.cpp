#include "searchcontroller.h"

SearchController::SearchController(): m_search("")
{

}

QString SearchController::search() const
{
    return m_search;
}

void SearchController::setSearch(const QString &newSearch)
{
    if (m_search == newSearch)
        return;
    m_search = newSearch;
    emit searchChanged();
}

// Implementação do método clear
void SearchController::clear()
{
    if (m_search.isEmpty())
        return;
    m_search.clear();
    emit searchChanged();
}
