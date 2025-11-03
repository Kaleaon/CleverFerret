package com.universalmedialibrary.services.ambient

import com.universalmedialibrary.data.local.entity.AmbientSound
import com.universalmedialibrary.data.local.entity.AmbientCategory
import com.universalmedialibrary.data.local.entity.AmbientSoundType

/**
 * Complete set of 84 ambient sounds from Moodist
 * Source: https://github.com/remvze/moodist
 * 
 * Categories:
 * - Nature (12 sounds)
 * - Rain (8 sounds)
 * - Animals (16 sounds)
 * - Urban (7 sounds)
 * - Places (16 sounds)
 * - Transport (6 sounds)
 * - Things (16 sounds)
 * - Noise (3 sounds)
 */
object MoodistSounds {
    
    fun getAllSounds(): List<AmbientSound> = listOf(
        // === NATURE CATEGORY (12 sounds) ===
        AmbientSound(
            name = "River",
            category = AmbientCategory.NATURE,
            soundType = AmbientSoundType.RIVER,
            description = "Gentle river flowing",
            keywords = listOf("river", "stream", "flowing", "water")
        ),
        AmbientSound(
            name = "Waves",
            category = AmbientCategory.WATER,
            soundType = AmbientSoundType.OCEAN,
            description = "Ocean waves on shore",
            keywords = listOf("waves", "ocean", "sea", "beach")
        ),
        AmbientSound(
            name = "Campfire",
            category = AmbientCategory.NATURE,
            soundType = AmbientSoundType.FIRE,
            description = "Crackling campfire",
            keywords = listOf("campfire", "fire", "crackling", "flames")
        ),
        AmbientSound(
            name = "Wind",
            category = AmbientCategory.NATURE,
            soundType = AmbientSoundType.WIND,
            description = "Gentle wind blowing",
            keywords = listOf("wind", "breeze", "blowing")
        ),
        AmbientSound(
            name = "Howling Wind",
            category = AmbientCategory.NATURE,
            soundType = AmbientSoundType.WIND,
            description = "Strong howling wind",
            keywords = listOf("wind", "howling", "storm", "strong")
        ),
        AmbientSound(
            name = "Wind in Trees",
            category = AmbientCategory.NATURE,
            soundType = AmbientSoundType.WIND,
            description = "Wind rustling through trees",
            keywords = listOf("wind", "trees", "rustling", "forest")
        ),
        AmbientSound(
            name = "Waterfall",
            category = AmbientCategory.WATER,
            soundType = AmbientSoundType.RIVER,
            description = "Cascading waterfall",
            keywords = listOf("waterfall", "cascade", "water", "flowing")
        ),
        AmbientSound(
            name = "Walk in Snow",
            category = AmbientCategory.WEATHER,
            soundType = AmbientSoundType.SNOW,
            description = "Footsteps crunching in snow",
            keywords = listOf("snow", "walking", "crunching", "winter")
        ),
        AmbientSound(
            name = "Walk on Leaves",
            category = AmbientCategory.NATURE,
            soundType = AmbientSoundType.FOREST,
            description = "Walking through autumn leaves",
            keywords = listOf("leaves", "walking", "autumn", "forest")
        ),
        AmbientSound(
            name = "Walk on Gravel",
            category = AmbientCategory.NATURE,
            soundType = AmbientSoundType.CUSTOM,
            description = "Footsteps on gravel path",
            keywords = listOf("gravel", "walking", "path", "steps")
        ),
        AmbientSound(
            name = "Droplets",
            category = AmbientCategory.WATER,
            soundType = AmbientSoundType.RAIN,
            description = "Water droplets falling",
            keywords = listOf("droplets", "water", "dripping", "drops")
        ),
        AmbientSound(
            name = "Jungle",
            category = AmbientCategory.NATURE,
            soundType = AmbientSoundType.FOREST,
            description = "Tropical jungle ambience",
            keywords = listOf("jungle", "tropical", "rainforest", "exotic")
        ),
        
        // === RAIN CATEGORY (8 sounds) ===
        AmbientSound(
            name = "Light Rain",
            category = AmbientCategory.WEATHER,
            soundType = AmbientSoundType.RAIN,
            description = "Gentle light rain",
            keywords = listOf("rain", "light", "drizzle", "gentle")
        ),
        AmbientSound(
            name = "Heavy Rain",
            category = AmbientCategory.WEATHER,
            soundType = AmbientSoundType.RAIN,
            description = "Heavy rainfall",
            keywords = listOf("rain", "heavy", "storm", "downpour")
        ),
        AmbientSound(
            name = "Thunder",
            category = AmbientCategory.WEATHER,
            soundType = AmbientSoundType.THUNDER,
            description = "Thunder and lightning",
            keywords = listOf("thunder", "lightning", "storm", "rumble")
        ),
        AmbientSound(
            name = "Rain on Window",
            category = AmbientCategory.WEATHER,
            soundType = AmbientSoundType.RAIN,
            description = "Rain tapping on window",
            keywords = listOf("rain", "window", "tapping", "indoor")
        ),
        AmbientSound(
            name = "Rain on Car Roof",
            category = AmbientCategory.WEATHER,
            soundType = AmbientSoundType.RAIN,
            description = "Rain drumming on car roof",
            keywords = listOf("rain", "car", "roof", "driving")
        ),
        AmbientSound(
            name = "Rain on Umbrella",
            category = AmbientCategory.WEATHER,
            soundType = AmbientSoundType.RAIN,
            description = "Rain hitting umbrella",
            keywords = listOf("rain", "umbrella", "walking")
        ),
        AmbientSound(
            name = "Rain on Tent",
            category = AmbientCategory.WEATHER,
            soundType = AmbientSoundType.RAIN,
            description = "Rain falling on camping tent",
            keywords = listOf("rain", "tent", "camping", "outdoor")
        ),
        AmbientSound(
            name = "Rain on Leaves",
            category = AmbientCategory.WEATHER,
            soundType = AmbientSoundType.RAIN,
            description = "Rain pattering on leaves",
            keywords = listOf("rain", "leaves", "forest", "nature")
        ),
        
        // === ANIMALS CATEGORY (16 sounds) ===
        AmbientSound(
            name = "Birds",
            category = AmbientCategory.NATURE,
            soundType = AmbientSoundType.BIRDS,
            description = "Birds chirping and singing",
            keywords = listOf("birds", "chirping", "singing", "morning")
        ),
        AmbientSound(
            name = "Seagulls",
            category = AmbientCategory.NATURE,
            soundType = AmbientSoundType.BIRDS,
            description = "Seagulls crying",
            keywords = listOf("seagulls", "beach", "coast", "ocean")
        ),
        AmbientSound(
            name = "Crickets",
            category = AmbientCategory.NATURE,
            soundType = AmbientSoundType.NIGHT,
            description = "Crickets chirping at night",
            keywords = listOf("crickets", "night", "evening", "insects")
        ),
        AmbientSound(
            name = "Wolf",
            category = AmbientCategory.NATURE,
            soundType = AmbientSoundType.CUSTOM,
            description = "Wolf howling",
            keywords = listOf("wolf", "howling", "wilderness", "night")
        ),
        AmbientSound(
            name = "Owl",
            category = AmbientCategory.NATURE,
            soundType = AmbientSoundType.CUSTOM,
            description = "Owl hooting",
            keywords = listOf("owl", "hooting", "night", "forest")
        ),
        AmbientSound(
            name = "Frog",
            category = AmbientCategory.NATURE,
            soundType = AmbientSoundType.CUSTOM,
            description = "Frogs croaking",
            keywords = listOf("frog", "croaking", "pond", "wetland")
        ),
        AmbientSound(
            name = "Dog Barking",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Dog barking in distance",
            keywords = listOf("dog", "barking", "pet", "domestic")
        ),
        AmbientSound(
            name = "Horse Gallop",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Horse galloping",
            keywords = listOf("horse", "gallop", "running", "hooves")
        ),
        AmbientSound(
            name = "Cat Purring",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Cat purring contentedly",
            keywords = listOf("cat", "purring", "pet", "relaxing")
        ),
        AmbientSound(
            name = "Crows",
            category = AmbientCategory.NATURE,
            soundType = AmbientSoundType.BIRDS,
            description = "Crows cawing",
            keywords = listOf("crows", "cawing", "birds")
        ),
        AmbientSound(
            name = "Whale",
            category = AmbientCategory.WATER,
            soundType = AmbientSoundType.UNDERWATER,
            description = "Whale calls underwater",
            keywords = listOf("whale", "underwater", "ocean", "calls")
        ),
        AmbientSound(
            name = "Beehive",
            category = AmbientCategory.NATURE,
            soundType = AmbientSoundType.CUSTOM,
            description = "Bees buzzing in hive",
            keywords = listOf("bees", "buzzing", "hive", "insects")
        ),
        AmbientSound(
            name = "Woodpecker",
            category = AmbientCategory.NATURE,
            soundType = AmbientSoundType.BIRDS,
            description = "Woodpecker tapping on tree",
            keywords = listOf("woodpecker", "tapping", "bird", "forest")
        ),
        AmbientSound(
            name = "Chickens",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Chickens clucking",
            keywords = listOf("chickens", "clucking", "farm", "birds")
        ),
        AmbientSound(
            name = "Cows",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Cows mooing",
            keywords = listOf("cows", "mooing", "farm", "cattle")
        ),
        AmbientSound(
            name = "Sheep",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Sheep bleating",
            keywords = listOf("sheep", "bleating", "farm", "pastoral")
        ),
        
        // === URBAN CATEGORY (7 sounds) ===
        AmbientSound(
            name = "Highway",
            category = AmbientCategory.URBAN,
            soundType = AmbientSoundType.TRAFFIC,
            description = "Highway traffic sounds",
            keywords = listOf("highway", "traffic", "cars", "road")
        ),
        AmbientSound(
            name = "Road",
            category = AmbientCategory.URBAN,
            soundType = AmbientSoundType.TRAFFIC,
            description = "Road traffic ambience",
            keywords = listOf("road", "traffic", "street", "cars")
        ),
        AmbientSound(
            name = "Ambulance Siren",
            category = AmbientCategory.URBAN,
            soundType = AmbientSoundType.CITY,
            description = "Ambulance siren passing",
            keywords = listOf("ambulance", "siren", "emergency", "city")
        ),
        AmbientSound(
            name = "Busy Street",
            category = AmbientCategory.URBAN,
            soundType = AmbientSoundType.CITY,
            description = "Busy city street ambience",
            keywords = listOf("street", "busy", "city", "urban")
        ),
        AmbientSound(
            name = "Crowd",
            category = AmbientCategory.URBAN,
            soundType = AmbientSoundType.CROWD,
            description = "Crowd of people talking",
            keywords = listOf("crowd", "people", "talking", "busy")
        ),
        AmbientSound(
            name = "Traffic",
            category = AmbientCategory.URBAN,
            soundType = AmbientSoundType.TRAFFIC,
            description = "City traffic ambience",
            keywords = listOf("traffic", "city", "cars", "urban")
        ),
        AmbientSound(
            name = "Fireworks",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Fireworks exploding",
            keywords = listOf("fireworks", "celebration", "explosions")
        ),
        
        // === PLACES CATEGORY (16 sounds) ===
        AmbientSound(
            name = "Cafe",
            category = AmbientCategory.INDOOR,
            soundType = AmbientSoundType.CAFE,
            description = "Cozy cafe ambience",
            keywords = listOf("cafe", "coffee", "shop", "chatter")
        ),
        AmbientSound(
            name = "Airport",
            category = AmbientCategory.URBAN,
            soundType = AmbientSoundType.CUSTOM,
            description = "Airport terminal sounds",
            keywords = listOf("airport", "terminal", "announcements", "travel")
        ),
        AmbientSound(
            name = "Church",
            category = AmbientCategory.INDOOR,
            soundType = AmbientSoundType.CUSTOM,
            description = "Church bells and ambience",
            keywords = listOf("church", "bells", "religious", "quiet")
        ),
        AmbientSound(
            name = "Temple",
            category = AmbientCategory.INDOOR,
            soundType = AmbientSoundType.CUSTOM,
            description = "Temple meditation ambience",
            keywords = listOf("temple", "meditation", "peaceful", "spiritual")
        ),
        AmbientSound(
            name = "Construction Site",
            category = AmbientCategory.URBAN,
            soundType = AmbientSoundType.CUSTOM,
            description = "Construction work sounds",
            keywords = listOf("construction", "building", "work", "tools")
        ),
        AmbientSound(
            name = "Underwater",
            category = AmbientCategory.WATER,
            soundType = AmbientSoundType.UNDERWATER,
            description = "Underwater ambience",
            keywords = listOf("underwater", "diving", "submerged", "ocean")
        ),
        AmbientSound(
            name = "Crowded Bar",
            category = AmbientCategory.INDOOR,
            soundType = AmbientSoundType.CROWD,
            description = "Busy bar atmosphere",
            keywords = listOf("bar", "crowded", "pub", "socializing")
        ),
        AmbientSound(
            name = "Night Village",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Quiet night village sounds",
            keywords = listOf("village", "night", "peaceful", "rural")
        ),
        AmbientSound(
            name = "Subway Station",
            category = AmbientCategory.URBAN,
            soundType = AmbientSoundType.TRAIN,
            description = "Subway station ambience",
            keywords = listOf("subway", "station", "metro", "underground")
        ),
        AmbientSound(
            name = "Office",
            category = AmbientCategory.INDOOR,
            soundType = AmbientSoundType.CUSTOM,
            description = "Office environment sounds",
            keywords = listOf("office", "work", "typing", "phone")
        ),
        AmbientSound(
            name = "Supermarket",
            category = AmbientCategory.INDOOR,
            soundType = AmbientSoundType.CUSTOM,
            description = "Supermarket shopping sounds",
            keywords = listOf("supermarket", "shopping", "store", "busy")
        ),
        AmbientSound(
            name = "Carousel",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Carousel music and sounds",
            keywords = listOf("carousel", "merry-go-round", "fair", "music")
        ),
        AmbientSound(
            name = "Laboratory",
            category = AmbientCategory.INDOOR,
            soundType = AmbientSoundType.CUSTOM,
            description = "Scientific laboratory sounds",
            keywords = listOf("laboratory", "science", "experiment", "equipment")
        ),
        AmbientSound(
            name = "Laundry Room",
            category = AmbientCategory.INDOOR,
            soundType = AmbientSoundType.CUSTOM,
            description = "Laundry machines running",
            keywords = listOf("laundry", "washing", "dryer", "machines")
        ),
        AmbientSound(
            name = "Restaurant",
            category = AmbientCategory.INDOOR,
            soundType = AmbientSoundType.CUSTOM,
            description = "Restaurant dining ambience",
            keywords = listOf("restaurant", "dining", "eating", "chatter")
        ),
        AmbientSound(
            name = "Library",
            category = AmbientCategory.INDOOR,
            soundType = AmbientSoundType.LIBRARY,
            description = "Quiet library atmosphere",
            keywords = listOf("library", "quiet", "reading", "study")
        ),
        
        // === TRANSPORT CATEGORY (6 sounds) ===
        AmbientSound(
            name = "Train",
            category = AmbientCategory.URBAN,
            soundType = AmbientSoundType.TRAIN,
            description = "Train passing by",
            keywords = listOf("train", "railway", "locomotive", "tracks")
        ),
        AmbientSound(
            name = "Inside a Train",
            category = AmbientCategory.URBAN,
            soundType = AmbientSoundType.TRAIN,
            description = "Inside moving train",
            keywords = listOf("train", "inside", "traveling", "railway")
        ),
        AmbientSound(
            name = "Airplane",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Airplane cabin ambience",
            keywords = listOf("airplane", "plane", "flying", "cabin")
        ),
        AmbientSound(
            name = "Submarine",
            category = AmbientCategory.WATER,
            soundType = AmbientSoundType.UNDERWATER,
            description = "Submarine interior sounds",
            keywords = listOf("submarine", "underwater", "sonar", "vessel")
        ),
        AmbientSound(
            name = "Sailboat",
            category = AmbientCategory.WATER,
            soundType = AmbientSoundType.OCEAN,
            description = "Sailboat on water",
            keywords = listOf("sailboat", "sailing", "boat", "ocean")
        ),
        AmbientSound(
            name = "Rowing Boat",
            category = AmbientCategory.WATER,
            soundType = AmbientSoundType.RIVER,
            description = "Rowing boat on water",
            keywords = listOf("rowing", "boat", "oars", "water")
        ),
        
        // === THINGS CATEGORY (16 sounds) ===
        AmbientSound(
            name = "Keyboard",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Computer keyboard typing",
            keywords = listOf("keyboard", "typing", "computer", "work")
        ),
        AmbientSound(
            name = "Typewriter",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Old typewriter clacking",
            keywords = listOf("typewriter", "vintage", "typing", "mechanical")
        ),
        AmbientSound(
            name = "Paper",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Paper rustling and turning",
            keywords = listOf("paper", "rustling", "pages", "turning")
        ),
        AmbientSound(
            name = "Clock",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Clock ticking",
            keywords = listOf("clock", "ticking", "time", "mechanical")
        ),
        AmbientSound(
            name = "Wind Chimes",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Wind chimes tinkling",
            keywords = listOf("wind chimes", "tinkling", "bells", "peaceful")
        ),
        AmbientSound(
            name = "Singing Bowl",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Tibetan singing bowl",
            keywords = listOf("singing bowl", "meditation", "peaceful", "tibetan")
        ),
        AmbientSound(
            name = "Ceiling Fan",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Ceiling fan whirring",
            keywords = listOf("ceiling fan", "fan", "whirring", "air")
        ),
        AmbientSound(
            name = "Dryer",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Clothes dryer tumbling",
            keywords = listOf("dryer", "tumbling", "laundry", "machine")
        ),
        AmbientSound(
            name = "Slide Projector",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Slide projector clicking",
            keywords = listOf("projector", "slides", "clicking", "vintage")
        ),
        AmbientSound(
            name = "Boiling Water",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Water boiling in kettle",
            keywords = listOf("boiling", "water", "kettle", "bubbling")
        ),
        AmbientSound(
            name = "Bubbles",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Bubbles popping",
            keywords = listOf("bubbles", "popping", "water", "air")
        ),
        AmbientSound(
            name = "Tuning Radio",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Radio tuning static",
            keywords = listOf("radio", "tuning", "static", "frequency")
        ),
        AmbientSound(
            name = "Morse Code",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Morse code beeping",
            keywords = listOf("morse code", "beeping", "communication", "signals")
        ),
        AmbientSound(
            name = "Washing Machine",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Washing machine running",
            keywords = listOf("washing machine", "laundry", "spin", "cycle")
        ),
        AmbientSound(
            name = "Vinyl Effect",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Vinyl record crackling",
            keywords = listOf("vinyl", "record", "crackling", "vintage")
        ),
        AmbientSound(
            name = "Windshield Wipers",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Car windshield wipers",
            keywords = listOf("wipers", "windshield", "car", "rhythmic")
        ),
        
        // === NOISE CATEGORY (3 sounds) ===
        AmbientSound(
            name = "White Noise",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.WHITE_NOISE,
            description = "Pure white noise for focus",
            keywords = listOf("white noise", "static", "focus", "concentration")
        ),
        AmbientSound(
            name = "Pink Noise",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.PINK_NOISE,
            description = "Balanced pink noise for relaxation",
            keywords = listOf("pink noise", "relaxation", "sleep", "calm")
        ),
        AmbientSound(
            name = "Brown Noise",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.BROWN_NOISE,
            description = "Deep brown noise for sleep",
            keywords = listOf("brown noise", "red noise", "deep", "sleep")
        )
    )
    
    /**
     * Get count by category
     */
    fun getCategoryCount(category: AmbientCategory): Int {
        return getAllSounds().count { it.category == category }
    }
    
    /**
     * Get total count
     */
    fun getTotalCount(): Int = getAllSounds().size
}
