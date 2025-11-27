.class public Lcom/dropbox/core/v2/files/PhotoMetadata$Builder;
.super Lcom/dropbox/core/v2/files/MediaMetadata$Builder;
.source "PhotoMetadata.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/files/PhotoMetadata;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# direct methods
.method protected constructor <init>()V
    .locals 0

    .line 97
    invoke-direct {p0}, Lcom/dropbox/core/v2/files/MediaMetadata$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic build()Lcom/dropbox/core/v2/files/MediaMetadata;
    .locals 1

    .line 95
    invoke-virtual {p0}, Lcom/dropbox/core/v2/files/PhotoMetadata$Builder;->build()Lcom/dropbox/core/v2/files/PhotoMetadata;

    move-result-object v0

    return-object v0
.end method

.method public build()Lcom/dropbox/core/v2/files/PhotoMetadata;
    .locals 4

    .line 143
    new-instance v0, Lcom/dropbox/core/v2/files/PhotoMetadata;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/PhotoMetadata$Builder;->dimensions:Lcom/dropbox/core/v2/files/Dimensions;

    iget-object v2, p0, Lcom/dropbox/core/v2/files/PhotoMetadata$Builder;->location:Lcom/dropbox/core/v2/files/GpsCoordinates;

    iget-object v3, p0, Lcom/dropbox/core/v2/files/PhotoMetadata$Builder;->timeTaken:Ljava/util/Date;

    invoke-direct {v0, v1, v2, v3}, Lcom/dropbox/core/v2/files/PhotoMetadata;-><init>(Lcom/dropbox/core/v2/files/Dimensions;Lcom/dropbox/core/v2/files/GpsCoordinates;Ljava/util/Date;)V

    return-object v0
.end method

.method public bridge synthetic withDimensions(Lcom/dropbox/core/v2/files/Dimensions;)Lcom/dropbox/core/v2/files/MediaMetadata$Builder;
    .locals 0

    .line 95
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/files/PhotoMetadata$Builder;->withDimensions(Lcom/dropbox/core/v2/files/Dimensions;)Lcom/dropbox/core/v2/files/PhotoMetadata$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withDimensions(Lcom/dropbox/core/v2/files/Dimensions;)Lcom/dropbox/core/v2/files/PhotoMetadata$Builder;
    .locals 0

    .line 108
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/files/MediaMetadata$Builder;->withDimensions(Lcom/dropbox/core/v2/files/Dimensions;)Lcom/dropbox/core/v2/files/MediaMetadata$Builder;

    return-object p0
.end method

.method public bridge synthetic withLocation(Lcom/dropbox/core/v2/files/GpsCoordinates;)Lcom/dropbox/core/v2/files/MediaMetadata$Builder;
    .locals 0

    .line 95
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/files/PhotoMetadata$Builder;->withLocation(Lcom/dropbox/core/v2/files/GpsCoordinates;)Lcom/dropbox/core/v2/files/PhotoMetadata$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withLocation(Lcom/dropbox/core/v2/files/GpsCoordinates;)Lcom/dropbox/core/v2/files/PhotoMetadata$Builder;
    .locals 0

    .line 120
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/files/MediaMetadata$Builder;->withLocation(Lcom/dropbox/core/v2/files/GpsCoordinates;)Lcom/dropbox/core/v2/files/MediaMetadata$Builder;

    return-object p0
.end method

.method public bridge synthetic withTimeTaken(Ljava/util/Date;)Lcom/dropbox/core/v2/files/MediaMetadata$Builder;
    .locals 0

    .line 95
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/files/PhotoMetadata$Builder;->withTimeTaken(Ljava/util/Date;)Lcom/dropbox/core/v2/files/PhotoMetadata$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withTimeTaken(Ljava/util/Date;)Lcom/dropbox/core/v2/files/PhotoMetadata$Builder;
    .locals 0

    .line 132
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/files/MediaMetadata$Builder;->withTimeTaken(Ljava/util/Date;)Lcom/dropbox/core/v2/files/MediaMetadata$Builder;

    return-object p0
.end method
