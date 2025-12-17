package com.universalmedialibrary.services.music.free

object FreeMusicCatalog {

    private val creativeCommonsAttribution = FreeMusicLicense(
        name = "CC BY 4.0",
        url = "https://creativecommons.org/licenses/by/4.0/",
        requiresAttribution = true
    )

    private val creativeCommonsShareAlike = FreeMusicLicense(
        name = "CC BY-SA 4.0",
        url = "https://creativecommons.org/licenses/by-sa/4.0/",
        requiresAttribution = true
    )

    private val creativeCommons0 = FreeMusicLicense(
        name = "CC0 1.0",
        url = "https://creativecommons.org/publicdomain/zero/1.0/",
        requiresAttribution = false
    )

    val tracks: List<FreeMusicTrack> = listOf(
        FreeMusicTrack(
            id = "fma_driven_to_success",
            title = "Driven To Success",
            artist = "Scott Holmes Music",
            album = "Corporate Presentation",
            streamUrl = "https://files.freemusicarchive.org/storage-freemusicarchive-org/music/Scott_Holmes_Music/Corporate_Presentation/Scott_Holmes_Music_-_Driven_To_Success.mp3",
            downloadUrl = "https://freemusicarchive.org/music/Scott_Holmes_Music/corporate-presentation/driven-to-success/",
            source = FreeMusicSource.FREE_MUSIC_ARCHIVE,
            license = creativeCommonsAttribution,
            durationSeconds = 204,
            tags = listOf("uplifting", "corporate", "instrumental"),
            coverUrl = "https://freemusicarchive.org/image/?file=images%2Falbums%2FScott_Holmes_Music_-_Corporate_Presentation_-_20190228112534163.jpg"
        ),
        FreeMusicTrack(
            id = "fma_night_on_the_docks",
            title = "Night on the Docks (Trumpet Mix)",
            artist = "Kevin MacLeod",
            album = "YouTube Audio Library",
            streamUrl = "https://files.freemusicarchive.org/storage-freemusicarchive-org/music/ccCommunity/Kevin_MacLeod/YouTube_Audio_Library/Kevin_MacLeod_-_Night_on_the_Docks_Trumpet_Mix.mp3",
            downloadUrl = "https://freemusicarchive.org/music/Kevin_MacLeod/YouTube_Audio_Library/Night_on_the_Docks_Trumpet_Mix/",
            source = FreeMusicSource.FREE_MUSIC_ARCHIVE,
            license = creativeCommonsAttribution,
            durationSeconds = 253,
            tags = listOf("noir", "jazz", "ambient"),
            coverUrl = "https://freemusicarchive.org/image/?file=images%2Falbums%2FKevin_MacLeod_-_YouTube_Audio_Library_-_20151023165147986.jpg"
        ),
        FreeMusicTrack(
            id = "jamendo_adventure",
            title = "Adventure",
            artist = "Crowander",
            album = "All the Colors",
            streamUrl = "https://prod-pleer.jamendo.com/?trackid=1384146&format=mp32",
            downloadUrl = "https://www.jamendo.com/track/1384146/adventure",
            source = FreeMusicSource.JAMENDO,
            license = creativeCommonsShareAlike,
            durationSeconds = 149,
            tags = listOf("acoustic", "folk", "uplifting"),
            coverUrl = "https://usercontent.jamendo.com?type=album&id=187163&width=300"
        ),
        FreeMusicTrack(
            id = "freesound_tropical_forest_birds",
            title = "Toucans singing in the Amazonian Rainforest",
            artist = "felix.blume",
            streamUrl = "https://cdn.freesound.org/previews/404/404114_1661766-hq.mp3",
            downloadUrl = "https://freesound.org/people/felix.blume/sounds/404114/",
            source = FreeMusicSource.FREESOUND,
            license = creativeCommons0,
            durationSeconds = 120,
            tags = listOf("nature", "ambient", "forest", "birds"),
            coverUrl = "https://freesound.org/static/img/logo-square.png"
        ),
        FreeMusicTrack(
            id = "freesound_space_drone",
            title = "Space Drone",
            artist = "tyops",
            streamUrl = "https://cdn.freesound.org/previews/415/415209_5121236-hq.mp3",
            downloadUrl = "https://freesound.org/people/tyops/sounds/415209/",
            source = FreeMusicSource.FREESOUND,
            license = creativeCommons0,
            durationSeconds = 119,
            tags = listOf("atmosphere", "drone", "space"),
            coverUrl = "https://freesound.org/static/img/logo-square.png"
        ),
        FreeMusicTrack(
            id = "jamendo_city_nights",
            title = "City Nights",
            artist = "Soundroll",
            album = "City Nights",
            streamUrl = "https://prod-pleer.jamendo.com/?trackid=1450211&format=mp32",
            downloadUrl = "https://www.jamendo.com/track/1450211/city-nights",
            source = FreeMusicSource.JAMENDO,
            license = creativeCommonsShareAlike,
            durationSeconds = 222,
            tags = listOf("electronic", "chill", "downtempo"),
            coverUrl = "https://usercontent.jamendo.com?type=album&id=191903&width=300"
        )
    )
}
