.class public Lcom/dropbox/core/v2/files/VideoMetadata$Builder;
.super Lcom/dropbox/core/v2/files/MediaMetadata$Builder;
.source "VideoMetadata.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/files/VideoMetadata;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected duration:Ljava/lang/Long;


# direct methods
.method protected constructor <init>()V
    .locals 1

    .line 114
    invoke-direct {p0}, Lcom/dropbox/core/v2/files/MediaMetadata$Builder;-><init>()V

    const/4 v0, 0x0

    .line 115
    iput-object v0, p0, Lcom/dropbox/core/v2/files/VideoMetadata$Builder;->duration:Ljava/lang/Long;

    return-void
.end method


# virtual methods
.method public bridge synthetic build()Lcom/dropbox/core/v2/files/MediaMetadata;
    .locals 1

    .line 110
    invoke-virtual {p0}, Lcom/dropbox/core/v2/files/VideoMetadata$Builder;->build()Lcom/dropbox/core/v2/files/VideoMetadata;

    move-result-object v0

    return-object v0
.end method

.method public build()Lcom/dropbox/core/v2/files/VideoMetadata;
    .locals 5

    .line 173
    new-instance v0, Lcom/dropbox/core/v2/files/VideoMetadata;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/VideoMetadata$Builder;->dimensions:Lcom/dropbox/core/v2/files/Dimensions;

    iget-object v2, p0, Lcom/dropbox/core/v2/files/VideoMetadata$Builder;->location:Lcom/dropbox/core/v2/files/GpsCoordinates;

    iget-object v3, p0, Lcom/dropbox/core/v2/files/VideoMetadata$Builder;->timeTaken:Ljava/util/Date;

    iget-object v4, p0, Lcom/dropbox/core/v2/files/VideoMetadata$Builder;->duration:Ljava/lang/Long;

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/dropbox/core/v2/files/VideoMetadata;-><init>(Lcom/dropbox/core/v2/files/Dimensions;Lcom/dropbox/core/v2/files/GpsCoordinates;Ljava/util/Date;Ljava/lang/Long;)V

    return-object v0
.end method

.method public bridge synthetic withDimensions(Lcom/dropbox/core/v2/files/Dimensions;)Lcom/dropbox/core/v2/files/MediaMetadata$Builder;
    .locals 0

    .line 110
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/files/VideoMetadata$Builder;->withDimensions(Lcom/dropbox/core/v2/files/Dimensions;)Lcom/dropbox/core/v2/files/VideoMetadata$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withDimensions(Lcom/dropbox/core/v2/files/Dimensions;)Lcom/dropbox/core/v2/files/VideoMetadata$Builder;
    .locals 0

    .line 138
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/files/MediaMetadata$Builder;->withDimensions(Lcom/dropbox/core/v2/files/Dimensions;)Lcom/dropbox/core/v2/files/MediaMetadata$Builder;

    return-object p0
.end method

.method public withDuration(Ljava/lang/Long;)Lcom/dropbox/core/v2/files/VideoMetadata$Builder;
    .locals 0

    .line 126
    iput-object p1, p0, Lcom/dropbox/core/v2/files/VideoMetadata$Builder;->duration:Ljava/lang/Long;

    return-object p0
.end method

.method public bridge synthetic withLocation(Lcom/dropbox/core/v2/files/GpsCoordinates;)Lcom/dropbox/core/v2/files/MediaMetadata$Builder;
    .locals 0

    .line 110
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/files/VideoMetadata$Builder;->withLocation(Lcom/dropbox/core/v2/files/GpsCoordinates;)Lcom/dropbox/core/v2/files/VideoMetadata$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withLocation(Lcom/dropbox/core/v2/files/GpsCoordinates;)Lcom/dropbox/core/v2/files/VideoMetadata$Builder;
    .locals 0

    .line 150
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/files/MediaMetadata$Builder;->withLocation(Lcom/dropbox/core/v2/files/GpsCoordinates;)Lcom/dropbox/core/v2/files/MediaMetadata$Builder;

    return-object p0
.end method

.method public bridge synthetic withTimeTaken(Ljava/util/Date;)Lcom/dropbox/core/v2/files/MediaMetadata$Builder;
    .locals 0

    .line 110
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/files/VideoMetadata$Builder;->withTimeTaken(Ljava/util/Date;)Lcom/dropbox/core/v2/files/VideoMetadata$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withTimeTaken(Ljava/util/Date;)Lcom/dropbox/core/v2/files/VideoMetadata$Builder;
    .locals 0

    .line 162
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/files/MediaMetadata$Builder;->withTimeTaken(Ljava/util/Date;)Lcom/dropbox/core/v2/files/MediaMetadata$Builder;

    return-object p0
.end method
