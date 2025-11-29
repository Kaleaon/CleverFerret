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
        private const val BASE_URL = "https://raw.githubusercontent.com/remvze/moodist/main/public/sounds/"    
    fun getAllSounds(): List<AmbientSound> = listOf(
        // === NATURE CATEGORY (12 sounds) ===
        AmbientSound(
            name = "River",
            category = AmbientCategory.NATURE,
            soundType = AmbientSoundType.RIVER,
            description = "Gentle river flowing",
            keywords = listOf("river", "stream", "flowing", "water"),
            audioUrl = "${BASE_URL}river.mp3"
        ),
        AmbientSound(
            name = "Waves",
            category = AmbientCategory.WATER,
            soundType = AmbientSoundType.OCEAN,
            description = "Ocean waves on shore",
            keywords = listOf("waves", "ocean", "sea", "beach"),
            audioUrl = "${BASE_URL}waves.mp3"
        ),
        AmbientSound(
            name = "Campfire",
            category = AmbientCategory.NATURE,
            soundType = AmbientSoundType.FIRE,
            description = "Crackling campfire",
            keywords = listOf("campfire", "fire", "crackling", "flames"),
            audioUrl = "${BASE_URL}campfire.mp3"
        ),
        AmbientSound(
            name = "Wind",
            category = AmbientCategory.NATURE,
            soundType = AmbientSoundType.WIND,
            description = "Gentle wind blowing",
            keywords = listOf("wind", "breeze", "blowing"),
            audioUrl = "${BASE_URL}wind.mp3"
        ),
        AmbientSound(
            name = "Howling Wind",
            category = AmbientCategory.NATURE,
            soundType = AmbientSoundType.WIND,
            description = "Strong howling wind",
            keywords = listOf("wind", "howling", "storm", "strong"),
            audioUrl = "${BASE_URL}howling-wind.mp3"
        ),
        AmbientSound(
            name = "Wind in Trees",
            category = AmbientCategory.NATURE,
            soundType = AmbientSoundType.WIND,
            description = "Wind rustling through trees",
            keywords = listOf("wind", "trees", "rustling", "forest"),
            audioUrl = "${BASE_URL}wind-in-trees.mp3"
        ),
        AmbientSound(
            name = "Waterfall",
            category = AmbientCategory.WATER,
            soundType = AmbientSoundType.RIVER,
            description = "Cascading waterfall",
            keywords = listOf("waterfall", "cascade", "water", "flowing"),
            audioUrl = "${BASE_URL}waterfall.mp3"
        ),
        AmbientSound(
            name = "Walk in Snow",
            category = AmbientCategory.WEATHER,
            soundType = AmbientSoundType.SNOW,
            description = "Footsteps crunching in snow",
            keywords = listOf("snow", "walking", "crunching", "winter"),
            audioUrl = "${BASE_URL}walk-in-snow.mp3"
        ),
        AmbientSound(
            name = "Walk on Leaves",
            category = AmbientCategory.NATURE,
            soundType = AmbientSoundType.FOREST,
            description = "Walking through autumn leaves",
            keywords = listOf("leaves", "walking", "autumn", "forest"),
            audioUrl = "${BASE_URL}walk-on-leaves.mp3"
        ),
        AmbientSound(
            name = "Walk on Gravel",
            category = AmbientCategory.NATURE,
            soundType = AmbientSoundType.CUSTOM,
            description = "Footsteps on gravel path",
            keywords = listOf("gravel", "walking", "path", "steps"),
            audioUrl = "${BASE_URL}walk-on-gravel.mp3"
        ),
        AmbientSound(
            name = "Droplets",
            category = AmbientCategory.WATER,
            soundType = AmbientSoundType.RAIN,
            description = "Water droplets falling",
            keywords = listOf("droplets", "water", "dripping", "drops"),
            audioUrl = "${BASE_URL}droplets.mp3"
        ),
        AmbientSound(
            name = "Jungle",
            category = AmbientCategory.NATURE,
            soundType = AmbientSoundType.FOREST,
            description = "Tropical jungle ambience",
            keywords = listOf("jungle", "tropical", "rainforest", "exotic"),
            audioUrl = "${BASE_URL}jungle.mp3"
        ),
        
        // === RAIN CATEGORY (8 sounds) ===
        AmbientSound(
            name = "Light Rain",
            category = AmbientCategory.WEATHER,
            soundType = AmbientSoundType.RAIN,
            description = "Gentle light rain",
            keywords = listOf("rain", "light", "drizzle", "gentle"),
            audioUrl = "${BASE_URL}light-rain.mp3"
        ),
        AmbientSound(
            name = "Heavy Rain",
            category = AmbientCategory.WEATHER,
            soundType = AmbientSoundType.RAIN,
            description = "Heavy rainfall",
            keywords = listOf("rain", "heavy", "storm", "downpour"),
            audioUrl = "${BASE_URL}heavy-rain.mp3"
        ),
        AmbientSound(
            name = "Thunder",
            category = AmbientCategory.WEATHER,
            soundType = AmbientSoundType.THUNDER,
            description = "Thunder and lightning",
            keywords = listOf("thunder", "lightning", "storm", "rumble"),
            audioUrl = "${BASE_URL}thunder.mp3"
        ),
        AmbientSound(
            name = "Rain on Window",
            category = AmbientCategory.WEATHER,
            soundType = AmbientSoundType.RAIN,
            description = "Rain tapping on window",
            keywords = listOf("rain", "window", "tapping", "indoor"),
            audioUrl = "${BASE_URL}rain-on-window.mp3"
        ),
        AmbientSound(
            name = "Rain on Car Roof",
            category = AmbientCategory.WEATHER,
            soundType = AmbientSoundType.RAIN,
            description = "Rain drumming on car roof",
            keywords = listOf("rain", "car", "roof", "driving"),
            audioUrl = "${BASE_URL}rain-on-car-roof.mp3"
        ),
        AmbientSound(
            name = "Rain on Umbrella",
            category = AmbientCategory.WEATHER,
            soundType = AmbientSoundType.RAIN,
            description = "Rain hitting umbrella",
            keywords = listOf("rain", "umbrella", "walking"),
            audioUrl = "${BASE_URL}rain-on-umbrella.mp3"
        ),
        AmbientSound(
            name = "Rain on Tent",
            category = AmbientCategory.WEATHER,
            soundType = AmbientSoundType.RAIN,
            description = "Rain falling on camping tent",
            keywords = listOf("rain", "tent", "camping", "outdoor"),
            audioUrl = "${BASE_URL}rain-on-tent.mp3"
        ),
        AmbientSound(
            name = "Rain on Leaves",
            category = AmbientCategory.WEATHER,
            soundType = AmbientSoundType.RAIN,
            description = "Rain pattering on leaves",
            keywords = listOf("rain", "leaves", "forest", "nature"),
            audioUrl = "${BASE_URL}rain-on-leaves.mp3"
        ),
        
        // === ANIMALS CATEGORY (16 sounds) ===
        AmbientSound(
            name = "Birds",
            category = AmbientCategory.NATURE,
            soundType = AmbientSoundType.BIRDS,
            description = "Birds chirping and singing",
            keywords = listOf("birds", "chirping", "singing", "morning"),
            audioUrl = "${BASE_URL}birds.mp3"
        ),
        AmbientSound(
            name = "Seagulls",
            category = AmbientCategory.NATURE,
            soundType = AmbientSoundType.BIRDS,
            description = "Seagulls crying",
            keywords = listOf("seagulls", "beach", "coast", "ocean"),
            audioUrl = "${BASE_URL}seagulls.mp3"
        ),
        AmbientSound(
            name = "Crickets",
            category = AmbientCategory.NATURE,
            soundType = AmbientSoundType.NIGHT,
            description = "Crickets chirping at night",
            keywords = listOf("crickets", "night", "evening", "insects"),
            audioUrl = "${BASE_URL}crickets.mp3"
        ),
        AmbientSound(
            name = "Wolf",
            category = AmbientCategory.NATURE,
            soundType = AmbientSoundType.CUSTOM,
            description = "Wolf howling",
            keywords = listOf("wolf", "howling", "wilderness", "night"),
            audioUrl = "${BASE_URL}wolf.mp3"
        ),
        AmbientSound(
            name = "Owl",
            category = AmbientCategory.NATURE,
            soundType = AmbientSoundType.CUSTOM,
            description = "Owl hooting",
            keywords = listOf("owl", "hooting", "night", "forest"),
            audioUrl = "${BASE_URL}owl.mp3"
        ),
        AmbientSound(
            name = "Frog",
            category = AmbientCategory.NATURE,
            soundType = AmbientSoundType.CUSTOM,
            description = "Frogs croaking",
            keywords = listOf("frog", "croaking", "pond", "wetland"),
            audioUrl = "${BASE_URL}frog.mp3"
        ),
        AmbientSound(
            name = "Dog Barking",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Dog barking in distance",
            keywords = listOf("dog", "barking", "pet", "domestic"),
            audioUrl = "${BASE_URL}dog-barking.mp3"
        ),
        AmbientSound(
            name = "Horse Gallop",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Horse galloping",
            keywords = listOf("horse", "gallop", "running", "hooves"),
            audioUrl = "${BASE_URL}horse-gallop.mp3"
        ),
        AmbientSound(
            name = "Cat Purring",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Cat purring contentedly",
            keywords = listOf("cat", "purring", "pet", "relaxing"),
            audioUrl = "${BASE_URL}cat-purring.mp3"
        ),
        AmbientSound(
            name = "Crows",
            category = AmbientCategory.NATURE,
            soundType = AmbientSoundType.BIRDS,
            description = "Crows cawing",
            keywords = listOf("crows", "cawing", "birds"),
            audioUrl = "${BASE_URL}crows.mp3"
        ),
        AmbientSound(
            name = "Whale",
            category = AmbientCategory.WATER,
            soundType = AmbientSoundType.UNDERWATER,
            description = "Whale calls underwater",
            keywords = listOf("whale", "underwater", "ocean", "calls"),
            audioUrl = "${BASE_URL}whale.mp3"
        ),
        AmbientSound(
            name = "Beehive",
            category = AmbientCategory.NATURE,
            soundType = AmbientSoundType.CUSTOM,
            description = "Bees buzzing in hive",
            keywords = listOf("bees", "buzzing", "hive", "insects"),
            audioUrl = "${BASE_URL}beehive.mp3"
        ),
        AmbientSound(
            name = "Woodpecker",
            category = AmbientCategory.NATURE,
            soundType = AmbientSoundType.BIRDS,
            description = "Woodpecker tapping on tree",
            keywords = listOf("woodpecker", "tapping", "bird", "forest"),
            audioUrl = "${BASE_URL}woodpecker.mp3"
        ),
        AmbientSound(
            name = "Chickens",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Chickens clucking",
            keywords = listOf("chickens", "clucking", "farm", "birds"),
            audioUrl = "${BASE_URL}chickens.mp3"
        ),
        AmbientSound(
            name = "Cows",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Cows mooing",
            keywords = listOf("cows", "mooing", "farm", "cattle"),
            audioUrl = "${BASE_URL}cows.mp3"
        ),
        AmbientSound(
            name = "Sheep",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Sheep bleating",
            keywords = listOf("sheep", "bleating", "farm", "pastoral"),
            audioUrl = "${BASE_URL}sheep.mp3"
        ),
        
        // === URBAN CATEGORY (7 sounds) ===
        AmbientSound(
            name = "Highway",
            category = AmbientCategory.URBAN,
            soundType = AmbientSoundType.TRAFFIC,
            description = "Highway traffic sounds",
            keywords = listOf("highway", "traffic", "cars", "road"),
            audioUrl = "${BASE_URL}highway.mp3"
        ),
        AmbientSound(
            name = "Road",
            category = AmbientCategory.URBAN,
            soundType = AmbientSoundType.TRAFFIC,
            description = "Road traffic ambience",
            keywords = listOf("road", "traffic", "street", "cars"),
            audioUrl = "${BASE_URL}road.mp3"
        ),
        AmbientSound(
            name = "Ambulance Siren",
            category = AmbientCategory.URBAN,
            soundType = AmbientSoundType.CITY,
            description = "Ambulance siren passing",
            keywords = listOf("ambulance", "siren", "emergency", "city"),
            audioUrl = "${BASE_URL}ambulance-siren.mp3"
        ),
        AmbientSound(
            name = "Busy Street",
            category = AmbientCategory.URBAN,
            soundType = AmbientSoundType.CITY,
            description = "Busy city street ambience",
            keywords = listOf("street", "busy", "city", "urban"),
            audioUrl = "${BASE_URL}busy-street.mp3"
        ),
        AmbientSound(
            name = "Crowd",
            category = AmbientCategory.URBAN,
            soundType = AmbientSoundType.CROWD,
            description = "Crowd of people talking",
            keywords = listOf("crowd", "people", "talking", "busy"),
            audioUrl = "${BASE_URL}crowd.mp3"
        ),
        AmbientSound(
            name = "Traffic",
            category = AmbientCategory.URBAN,
            soundType = AmbientSoundType.TRAFFIC,
            description = "City traffic ambience",
            keywords = listOf("traffic", "city", "cars", "urban"),
            audioUrl = "${BASE_URL}traffic.mp3"
        ),
        AmbientSound(
            name = "Fireworks",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Fireworks exploding",
            keywords = listOf("fireworks", "celebration", "explosions"),
            audioUrl = "${BASE_URL}fireworks.mp3"
        ),
        
        // === PLACES CATEGORY (16 sounds) ===
        AmbientSound(
            name = "Cafe",
            category = AmbientCategory.INDOOR,
            soundType = AmbientSoundType.CAFE,
            description = "Cozy cafe ambience",
            keywords = listOf("cafe", "coffee", "shop", "chatter"),
            audioUrl = "${BASE_URL}cafe.mp3"
        ),
        AmbientSound(
            name = "Airport",
            category = AmbientCategory.URBAN,
            soundType = AmbientSoundType.CUSTOM,
            description = "Airport terminal sounds",
            keywords = listOf("airport", "terminal", "announcements", "travel"),
            audioUrl = "${BASE_URL}airport.mp3"
        ),
        AmbientSound(
            name = "Church",
            category = AmbientCategory.INDOOR,
            soundType = AmbientSoundType.CUSTOM,
            description = "Church bells and ambience",
            keywords = listOf("church", "bells", "religious", "quiet"),
            audioUrl = "${BASE_URL}church.mp3"
        ),
        AmbientSound(
            name = "Temple",
            category = AmbientCategory.INDOOR,
            soundType = AmbientSoundType.CUSTOM,
            description = "Temple meditation ambience",
            keywords = listOf("temple", "meditation", "peaceful", "spiritual"),
            audioUrl = "${BASE_URL}temple.mp3"
        ),
        AmbientSound(
            name = "Construction Site",
            category = AmbientCategory.URBAN,
            soundType = AmbientSoundType.CUSTOM,
            description = "Construction work sounds",
            keywords = listOf("construction", "building", "work", "tools"),
            audioUrl = "${BASE_URL}construction-site.mp3"
        ),
        AmbientSound(
            name = "Underwater",
            category = AmbientCategory.WATER,
            soundType = AmbientSoundType.UNDERWATER,
            description = "Underwater ambience",
            keywords = listOf("underwater", "diving", "submerged", "ocean"),
            audioUrl = "${BASE_URL}underwater.mp3"
        ),
        AmbientSound(
            name = "Crowded Bar",
            category = AmbientCategory.INDOOR,
            soundType = AmbientSoundType.CROWD,
            description = "Busy bar atmosphere",
            keywords = listOf("bar", "crowded", "pub", "socializing"),
            audioUrl = "${BASE_URL}crowded-bar.mp3"
        ),
        AmbientSound(
            name = "Night Village",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Quiet night village sounds",
            keywords = listOf("village", "night", "peaceful", "rural"),
            audioUrl = "${BASE_URL}night-village.mp3"
        ),
        AmbientSound(
            name = "Subway Station",
            category = AmbientCategory.URBAN,
            soundType = AmbientSoundType.TRAIN,
            description = "Subway station ambience",
            keywords = listOf("subway", "station", "metro", "underground"),
            audioUrl = "${BASE_URL}subway-station.mp3"
        ),
        AmbientSound(
            name = "Office",
            category = AmbientCategory.INDOOR,
            soundType = AmbientSoundType.CUSTOM,
            description = "Office environment sounds",
            keywords = listOf("office", "work", "typing", "phone"),
            audioUrl = "${BASE_URL}office.mp3"
        ),
        AmbientSound(
            name = "Supermarket",
            category = AmbientCategory.INDOOR,
            soundType = AmbientSoundType.CUSTOM,
            description = "Supermarket shopping sounds",
            keywords = listOf("supermarket", "shopping", "store", "busy"),
            audioUrl = "${BASE_URL}supermarket.mp3"
        ),
        AmbientSound(
            name = "Carousel",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Carousel music and sounds",
            keywords = listOf("carousel", "merry-go-round", "fair", "music"),
            audioUrl = "${BASE_URL}carousel.mp3"
        ),
        AmbientSound(
            name = "Laboratory",
            category = AmbientCategory.INDOOR,
            soundType = AmbientSoundType.CUSTOM,
            description = "Scientific laboratory sounds",
            keywords = listOf("laboratory", "science", "experiment", "equipment"),
            audioUrl = "${BASE_URL}laboratory.mp3"
        ),
        AmbientSound(
            name = "Laundry Room",
            category = AmbientCategory.INDOOR,
            soundType = AmbientSoundType.CUSTOM,
            description = "Laundry machines running",
            keywords = listOf("laundry", "washing", "dryer", "machines"),
            audioUrl = "${BASE_URL}laundry-room.mp3"
        ),
        AmbientSound(
            name = "Restaurant",
            category = AmbientCategory.INDOOR,
            soundType = AmbientSoundType.CUSTOM,
            description = "Restaurant dining ambience",
            keywords = listOf("restaurant", "dining", "eating", "chatter"),
            audioUrl = "${BASE_URL}restaurant.mp3"
        ),
        AmbientSound(
            name = "Library",
            category = AmbientCategory.INDOOR,
            soundType = AmbientSoundType.LIBRARY,
            description = "Quiet library atmosphere",
            keywords = listOf("library", "quiet", "reading", "study"),
            audioUrl = "${BASE_URL}library.mp3"
        ),
        
        // === TRANSPORT CATEGORY (6 sounds) ===
        AmbientSound(
            name = "Train",
            category = AmbientCategory.URBAN,
            soundType = AmbientSoundType.TRAIN,
            description = "Train passing by",
            keywords = listOf("train", "railway", "locomotive", "tracks"),
            audioUrl = "${BASE_URL}train.mp3"
        ),
        AmbientSound(
            name = "Inside a Train",
            category = AmbientCategory.URBAN,
            soundType = AmbientSoundType.TRAIN,
            description = "Inside moving train",
            keywords = listOf("train", "inside", "traveling", "railway"),
            audioUrl = "${BASE_URL}inside-a-train.mp3"
        ),
        AmbientSound(
            name = "Airplane",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Airplane cabin ambience",
            keywords = listOf("airplane", "plane", "flying", "cabin"),
            audioUrl = "${BASE_URL}airplane.mp3"
        ),
        AmbientSound(
            name = "Submarine",
            category = AmbientCategory.WATER,
            soundType = AmbientSoundType.UNDERWATER,
            description = "Submarine interior sounds",
            keywords = listOf("submarine", "underwater", "sonar", "vessel"),
            audioUrl = "${BASE_URL}submarine.mp3"
        ),
        AmbientSound(
            name = "Sailboat",
            category = AmbientCategory.WATER,
            soundType = AmbientSoundType.OCEAN,
            description = "Sailboat on water",
            keywords = listOf("sailboat", "sailing", "boat", "ocean"),
            audioUrl = "${BASE_URL}sailboat.mp3"
        ),
        AmbientSound(
            name = "Rowing Boat",
            category = AmbientCategory.WATER,
            soundType = AmbientSoundType.RIVER,
            description = "Rowing boat on water",
            keywords = listOf("rowing", "boat", "oars", "water"),
            audioUrl = "${BASE_URL}rowing-boat.mp3"
        ),
        
        // === THINGS CATEGORY (16 sounds) ===
        AmbientSound(
            name = "Keyboard",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Computer keyboard typing",
            keywords = listOf("keyboard", "typing", "computer", "work"),
            audioUrl = "${BASE_URL}keyboard.mp3"
        ),
        AmbientSound(
            name = "Typewriter",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Old typewriter clacking",
            keywords = listOf("typewriter", "vintage", "typing", "mechanical"),
            audioUrl = "${BASE_URL}typewriter.mp3"
        ),
        AmbientSound(
            name = "Paper",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Paper rustling and turning",
            keywords = listOf("paper", "rustling", "pages", "turning"),
            audioUrl = "${BASE_URL}paper.mp3"
        ),
        AmbientSound(
            name = "Clock",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Clock ticking",
            keywords = listOf("clock", "ticking", "time", "mechanical"),
            audioUrl = "${BASE_URL}clock.mp3"
        ),
        AmbientSound(
            name = "Wind Chimes",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Wind chimes tinkling",
            keywords = listOf("wind chimes", "tinkling", "bells", "peaceful"),
            audioUrl = "${BASE_URL}wind-chimes.mp3"
        ),
        AmbientSound(
            name = "Singing Bowl",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Tibetan singing bowl",
            keywords = listOf("singing bowl", "meditation", "peaceful", "tibetan"),
            audioUrl = "${BASE_URL}singing-bowl.mp3"
        ),
        AmbientSound(
            name = "Ceiling Fan",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Ceiling fan whirring",
            keywords = listOf("ceiling fan", "fan", "whirring", "air"),
            audioUrl = "${BASE_URL}ceiling-fan.mp3"
        ),
        AmbientSound(
            name = "Dryer",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Clothes dryer tumbling",
            keywords = listOf("dryer", "tumbling", "laundry", "machine"),
            audioUrl = "${BASE_URL}dryer.mp3"
        ),
        AmbientSound(
            name = "Slide Projector",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Slide projector clicking",
            keywords = listOf("projector", "slides", "clicking", "vintage"),
            audioUrl = "${BASE_URL}slide-projector.mp3"
        ),
        AmbientSound(
            name = "Boiling Water",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Water boiling in kettle",
            keywords = listOf("boiling", "water", "kettle", "bubbling"),
            audioUrl = "${BASE_URL}boiling-water.mp3"
        ),
        AmbientSound(
            name = "Bubbles",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Bubbles popping",
            keywords = listOf("bubbles", "popping", "water", "air"),
            audioUrl = "${BASE_URL}bubbles.mp3"
        ),
        AmbientSound(
            name = "Tuning Radio",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Radio tuning static",
            keywords = listOf("radio", "tuning", "static", "frequency"),
            audioUrl = "${BASE_URL}tuning-radio.mp3"
        ),
        AmbientSound(
            name = "Morse Code",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Morse code beeping",
            keywords = listOf("morse code", "beeping", "communication", "signals"),
            audioUrl = "${BASE_URL}morse-code.mp3"
        ),
        AmbientSound(
            name = "Washing Machine",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Washing machine running",
            keywords = listOf("washing machine", "laundry", "spin", "cycle"),
            audioUrl = "${BASE_URL}washing-machine.mp3"
        ),
        AmbientSound(
            name = "Vinyl Effect",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Vinyl record crackling",
            keywords = listOf("vinyl", "record", "crackling", "vintage"),
            audioUrl = "${BASE_URL}vinyl-effect.mp3"
        ),
        AmbientSound(
            name = "Windshield Wipers",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Car windshield wipers",
            keywords = listOf("wipers", "windshield", "car", "rhythmic"),
            audioUrl = "${BASE_URL}windshield-wipers.mp3"
        ),
        
        // === NOISE CATEGORY (3 sounds) ===
        AmbientSound(
            name = "White Noise",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.WHITE_NOISE,
            description = "Pure white noise for focus",
            keywords = listOf("white noise", "static", "focus", "concentration"),
            audioUrl = "${BASE_URL}white-noise.mp3"
        ),
        AmbientSound(
            name = "Pink Noise",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.PINK_NOISE,
            description = "Balanced pink noise for relaxation",
            keywords = listOf("pink noise", "relaxation", "sleep", "calm"),
            audioUrl = "${BASE_URL}pink-noise.mp3"
        ),
        AmbientSound(
            name = "Brown Noise",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.BROWN_NOISE,
            description = "Deep brown noise for sleep",
            keywords = listOf("brown noise", "red noise", "deep", "sleep"),
            audioUrl = "${BASE_URL}brown-noise.mp3"
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

