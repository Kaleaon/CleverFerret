package com.universalmedialibrary.services.news

import javax.inject.Inject
import javax.inject.Singleton

/**
 * Registry of built-in news recipes.
 */
@Singleton
class NewsRecipeRegistry @Inject constructor() {

    val builtInRecipes = listOf(
        NewsRecipe(
            id = "bbc_news",
            title = "BBC News",
            description = "Top stories from BBC News",
            feeds = listOf(
                NewsFeed("Top Stories", "http://feeds.bbci.co.uk/news/rss.xml"),
                NewsFeed("World", "http://feeds.bbci.co.uk/news/world/rss.xml"),
                NewsFeed("Technology", "http://feeds.bbci.co.uk/news/technology/rss.xml")
            ),
            keepOnlyTags = listOf("article", ".story-body__inner")
        ),
        NewsRecipe(
            id = "cnn_news",
            title = "CNN",
            description = "Breaking news from CNN",
            feeds = listOf(
                NewsFeed("Top Stories", "http://rss.cnn.com/rss/cnn_topstories.rss"),
                NewsFeed("Tech", "http://rss.cnn.com/rss/cnn_tech.rss")
            ),
            keepOnlyTags = listOf(".zn-body__paragraph", ".article__content")
        ),
        NewsRecipe(
            id = "hacker_news",
            title = "Hacker News",
            description = "Top links from Y Combinator",
            feeds = listOf(
                NewsFeed("Front Page", "https://news.ycombinator.com/rss")
            ),
            autoCleanup = true
        ),
        NewsRecipe(
            id = "arstechnica",
            title = "Ars Technica",
            description = "Technology news",
            feeds = listOf(
                NewsFeed("Main", "http://feeds.arstechnica.com/arstechnica/index")
            ),
            keepOnlyTags = listOf("section.article-content")
        )
    )

    fun getRecipeById(id: String): NewsRecipe? {
        return builtInRecipes.find { it.id == id }
    }
}
