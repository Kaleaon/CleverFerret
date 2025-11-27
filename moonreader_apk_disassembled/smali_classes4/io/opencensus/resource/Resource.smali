.class public abstract Lio/opencensus/resource/Resource;
.super Ljava/lang/Object;
.source "Resource.java"


# static fields
.field private static final ENV_LABEL_MAP:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final ENV_TYPE:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private static final ERROR_MESSAGE_INVALID_CHARS:Ljava/lang/String; = " should be a ASCII string with a length greater than 0 and not exceed 255 characters."

.field private static final ERROR_MESSAGE_INVALID_VALUE:Ljava/lang/String; = " should be a ASCII string with a length not exceed 255 characters."

.field private static final LABEL_KEY_VALUE_SPLITTER:Ljava/lang/String; = "="

.field private static final LABEL_LIST_SPLITTER:Ljava/lang/String; = ","

.field static final MAX_LENGTH:I = 0xff

.field private static final OC_RESOURCE_LABELS_ENV:Ljava/lang/String; = "OC_RESOURCE_LABELS"

.field private static final OC_RESOURCE_TYPE_ENV:Ljava/lang/String; = "OC_RESOURCE_TYPE"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 58
    const-string v0, "OC_RESOURCE_TYPE"

    invoke-static {v0}, Ljava/lang/System;->getenv(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lio/opencensus/resource/Resource;->parseResourceType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lio/opencensus/resource/Resource;->ENV_TYPE:Ljava/lang/String;

    .line 60
    const-string v0, "OC_RESOURCE_LABELS"

    .line 61
    invoke-static {v0}, Ljava/lang/System;->getenv(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lio/opencensus/resource/Resource;->parseResourceLabels(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lio/opencensus/resource/Resource;->ENV_LABEL_MAP:Ljava/util/Map;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(Ljava/lang/String;Ljava/util/Map;)Lio/opencensus/resource/Resource;
    .locals 2
    .param p0    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lio/opencensus/resource/Resource;"
        }
    .end annotation

    .line 105
    new-instance v0, Ljava/util/LinkedHashMap;

    const-string v1, "labels"

    .line 108
    invoke-static {p1, v1}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map;

    invoke-direct {v0, p1}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    .line 107
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p1

    .line 105
    invoke-static {p0, p1}, Lio/opencensus/resource/Resource;->createInternal(Ljava/lang/String;Ljava/util/Map;)Lio/opencensus/resource/Resource;

    move-result-object p0

    return-object p0
.end method

.method public static createFromEnvironmentVariables()Lio/opencensus/resource/Resource;
    .locals 2

    .line 90
    sget-object v0, Lio/opencensus/resource/Resource;->ENV_TYPE:Ljava/lang/String;

    sget-object v1, Lio/opencensus/resource/Resource;->ENV_LABEL_MAP:Ljava/util/Map;

    invoke-static {v0, v1}, Lio/opencensus/resource/Resource;->createInternal(Ljava/lang/String;Ljava/util/Map;)Lio/opencensus/resource/Resource;

    move-result-object v0

    return-object v0
.end method

.method private static createInternal(Ljava/lang/String;Ljava/util/Map;)Lio/opencensus/resource/Resource;
    .locals 1
    .param p0    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lio/opencensus/resource/Resource;"
        }
    .end annotation

    .line 129
    new-instance v0, Lio/opencensus/resource/AutoValue_Resource;

    invoke-direct {v0, p0, p1}, Lio/opencensus/resource/AutoValue_Resource;-><init>(Ljava/lang/String;Ljava/util/Map;)V

    return-object v0
.end method

.method private static isValid(Ljava/lang/String;)Z
    .locals 2

    .line 208
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    if-gt v0, v1, :cond_0

    invoke-static {p0}, Lio/opencensus/internal/StringUtils;->isPrintableString(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private static isValidAndNotEmpty(Ljava/lang/String;)Z
    .locals 1

    .line 219
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p0}, Lio/opencensus/resource/Resource;->isValid(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private static merge(Lio/opencensus/resource/Resource;Lio/opencensus/resource/Resource;)Lio/opencensus/resource/Resource;
    .locals 3
    .param p0    # Lio/opencensus/resource/Resource;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p1    # Lio/opencensus/resource/Resource;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    if-nez p1, :cond_0

    return-object p0

    :cond_0
    if-nez p0, :cond_1

    return-object p1

    .line 189
    :cond_1
    invoke-virtual {p0}, Lio/opencensus/resource/Resource;->getType()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lio/opencensus/resource/Resource;->getType()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_2
    invoke-virtual {p1}, Lio/opencensus/resource/Resource;->getType()Ljava/lang/String;

    move-result-object v0

    .line 190
    :goto_0
    new-instance v1, Ljava/util/LinkedHashMap;

    .line 191
    invoke-virtual {p1}, Lio/opencensus/resource/Resource;->getLabels()Ljava/util/Map;

    move-result-object p1

    invoke-direct {v1, p1}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    .line 194
    invoke-virtual {p0}, Lio/opencensus/resource/Resource;->getLabels()Ljava/util/Map;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_3

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map$Entry;

    .line 195
    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p1

    invoke-interface {v1, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 197
    :cond_3
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p0

    invoke-static {v0, p0}, Lio/opencensus/resource/Resource;->createInternal(Ljava/lang/String;Ljava/util/Map;)Lio/opencensus/resource/Resource;

    move-result-object p0

    return-object p0
.end method

.method public static mergeResources(Ljava/util/List;)Lio/opencensus/resource/Resource;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lio/opencensus/resource/Resource;",
            ">;)",
            "Lio/opencensus/resource/Resource;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 122
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 v0, 0x0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/opencensus/resource/Resource;

    .line 123
    invoke-static {v0, v1}, Lio/opencensus/resource/Resource;->merge(Lio/opencensus/resource/Resource;Lio/opencensus/resource/Resource;)Lio/opencensus/resource/Resource;

    move-result-object v0

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method static parseResourceLabels(Ljava/lang/String;)Ljava/util/Map;
    .locals 9
    .param p0    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    if-nez p0, :cond_0

    .line 157
    sget-object p0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    return-object p0

    .line 159
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 160
    const-string v1, ","

    const/4 v2, -0x1

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object p0

    .line 161
    array-length v1, p0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v1, :cond_2

    aget-object v5, p0, v4

    .line 162
    const-string v6, "="

    invoke-virtual {v5, v6, v2}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v5

    .line 163
    array-length v6, v5

    const/4 v7, 0x2

    if-eq v6, v7, :cond_1

    goto :goto_1

    .line 166
    :cond_1
    aget-object v6, v5, v3

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x1

    .line 167
    aget-object v5, v5, v7

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    const-string v7, "^\"|\"$"

    const-string v8, ""

    invoke-virtual {v5, v7, v8}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 168
    invoke-static {v6}, Lio/opencensus/resource/Resource;->isValidAndNotEmpty(Ljava/lang/String;)Z

    move-result v7

    const-string v8, "Label key should be a ASCII string with a length greater than 0 and not exceed 255 characters."

    invoke-static {v7, v8}, Lio/opencensus/internal/Utils;->checkArgument(ZLjava/lang/Object;)V

    .line 169
    invoke-static {v5}, Lio/opencensus/resource/Resource;->isValid(Ljava/lang/String;)Z

    move-result v7

    const-string v8, "Label value should be a ASCII string with a length not exceed 255 characters."

    invoke-static {v7, v8}, Lio/opencensus/internal/Utils;->checkArgument(ZLjava/lang/Object;)V

    .line 170
    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 172
    :cond_2
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method static parseResourceType(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    if-eqz p0, :cond_0

    .line 140
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 141
    invoke-static {p0}, Lio/opencensus/resource/Resource;->isValidAndNotEmpty(Ljava/lang/String;)Z

    move-result v0

    const-string v1, "Type should be a ASCII string with a length greater than 0 and not exceed 255 characters."

    invoke-static {v0, v1}, Lio/opencensus/internal/Utils;->checkArgument(ZLjava/lang/Object;)V

    .line 142
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    :cond_0
    return-object p0
.end method


# virtual methods
.method public abstract getLabels()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getType()Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end method
