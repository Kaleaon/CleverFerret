.class Lcom/dropbox/core/v2/files/SearchV2Arg;
.super Ljava/lang/Object;
.source "SearchV2Arg.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/SearchV2Arg$Serializer;,
        Lcom/dropbox/core/v2/files/SearchV2Arg$Builder;
    }
.end annotation


# instance fields
.field protected final includeHighlights:Ljava/lang/Boolean;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final matchFieldOptions:Lcom/dropbox/core/v2/files/SearchMatchFieldOptions;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final options:Lcom/dropbox/core/v2/files/SearchOptions;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final query:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 75
    invoke-direct {p0, p1, v0, v0, v0}, Lcom/dropbox/core/v2/files/SearchV2Arg;-><init>(Ljava/lang/String;Lcom/dropbox/core/v2/files/SearchOptions;Lcom/dropbox/core/v2/files/SearchMatchFieldOptions;Ljava/lang/Boolean;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/dropbox/core/v2/files/SearchOptions;Lcom/dropbox/core/v2/files/SearchMatchFieldOptions;Ljava/lang/Boolean;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/dropbox/core/v2/files/SearchOptions;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Lcom/dropbox/core/v2/files/SearchMatchFieldOptions;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Ljava/lang/Boolean;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 53
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x3e8

    if-gt v0, v1, :cond_0

    .line 56
    iput-object p1, p0, Lcom/dropbox/core/v2/files/SearchV2Arg;->query:Ljava/lang/String;

    .line 57
    iput-object p2, p0, Lcom/dropbox/core/v2/files/SearchV2Arg;->options:Lcom/dropbox/core/v2/files/SearchOptions;

    .line 58
    iput-object p3, p0, Lcom/dropbox/core/v2/files/SearchV2Arg;->matchFieldOptions:Lcom/dropbox/core/v2/files/SearchMatchFieldOptions;

    .line 59
    iput-object p4, p0, Lcom/dropbox/core/v2/files/SearchV2Arg;->includeHighlights:Ljava/lang/Boolean;

    return-void

    .line 54
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'query\' is longer than 1000"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 51
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'query\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static newBuilder(Ljava/lang/String;)Lcom/dropbox/core/v2/files/SearchV2Arg$Builder;
    .locals 1

    .line 132
    new-instance v0, Lcom/dropbox/core/v2/files/SearchV2Arg$Builder;

    invoke-direct {v0, p0}, Lcom/dropbox/core/v2/files/SearchV2Arg$Builder;-><init>(Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-nez p1, :cond_1

    return v1

    .line 226
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 227
    check-cast p1, Lcom/dropbox/core/v2/files/SearchV2Arg;

    .line 228
    iget-object v2, p0, Lcom/dropbox/core/v2/files/SearchV2Arg;->query:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/SearchV2Arg;->query:Ljava/lang/String;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/files/SearchV2Arg;->options:Lcom/dropbox/core/v2/files/SearchOptions;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/SearchV2Arg;->options:Lcom/dropbox/core/v2/files/SearchOptions;

    if-eq v2, v3, :cond_3

    if-eqz v2, :cond_5

    .line 229
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/files/SearchOptions;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/files/SearchV2Arg;->matchFieldOptions:Lcom/dropbox/core/v2/files/SearchMatchFieldOptions;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/SearchV2Arg;->matchFieldOptions:Lcom/dropbox/core/v2/files/SearchMatchFieldOptions;

    if-eq v2, v3, :cond_4

    if-eqz v2, :cond_5

    .line 230
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/files/SearchMatchFieldOptions;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/files/SearchV2Arg;->includeHighlights:Ljava/lang/Boolean;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/SearchV2Arg;->includeHighlights:Ljava/lang/Boolean;

    if-eq v2, p1, :cond_6

    if-eqz v2, :cond_5

    .line 231
    invoke-virtual {v2, p1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_0

    :cond_5
    return v1

    :cond_6
    :goto_0
    return v0

    :cond_7
    return v1
.end method

.method public getIncludeHighlights()Ljava/lang/Boolean;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 116
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SearchV2Arg;->includeHighlights:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getMatchFieldOptions()Lcom/dropbox/core/v2/files/SearchMatchFieldOptions;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 106
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SearchV2Arg;->matchFieldOptions:Lcom/dropbox/core/v2/files/SearchMatchFieldOptions;

    return-object v0
.end method

.method public getOptions()Lcom/dropbox/core/v2/files/SearchOptions;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 96
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SearchV2Arg;->options:Lcom/dropbox/core/v2/files/SearchOptions;

    return-object v0
.end method

.method public getQuery()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 86
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SearchV2Arg;->query:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 6

    .line 208
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SearchV2Arg;->query:Ljava/lang/String;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/SearchV2Arg;->options:Lcom/dropbox/core/v2/files/SearchOptions;

    iget-object v2, p0, Lcom/dropbox/core/v2/files/SearchV2Arg;->matchFieldOptions:Lcom/dropbox/core/v2/files/SearchMatchFieldOptions;

    iget-object v3, p0, Lcom/dropbox/core/v2/files/SearchV2Arg;->includeHighlights:Ljava/lang/Boolean;

    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    const/4 v0, 0x1

    aput-object v1, v4, v0

    const/4 v0, 0x2

    aput-object v2, v4, v0

    const/4 v0, 0x3

    aput-object v3, v4, v0

    invoke-static {v4}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 241
    sget-object v0, Lcom/dropbox/core/v2/files/SearchV2Arg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/SearchV2Arg$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/SearchV2Arg$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 253
    sget-object v0, Lcom/dropbox/core/v2/files/SearchV2Arg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/SearchV2Arg$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/SearchV2Arg$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
