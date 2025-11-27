.class public Lcom/dropbox/core/v2/files/MediaMetadata$Builder;
.super Ljava/lang/Object;
.source "MediaMetadata.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/files/MediaMetadata;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected dimensions:Lcom/dropbox/core/v2/files/Dimensions;

.field protected location:Lcom/dropbox/core/v2/files/GpsCoordinates;

.field protected timeTaken:Ljava/util/Date;


# direct methods
.method protected constructor <init>()V
    .locals 1

    .line 110
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 111
    iput-object v0, p0, Lcom/dropbox/core/v2/files/MediaMetadata$Builder;->dimensions:Lcom/dropbox/core/v2/files/Dimensions;

    .line 112
    iput-object v0, p0, Lcom/dropbox/core/v2/files/MediaMetadata$Builder;->location:Lcom/dropbox/core/v2/files/GpsCoordinates;

    .line 113
    iput-object v0, p0, Lcom/dropbox/core/v2/files/MediaMetadata$Builder;->timeTaken:Ljava/util/Date;

    return-void
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/files/MediaMetadata;
    .locals 4

    .line 159
    new-instance v0, Lcom/dropbox/core/v2/files/MediaMetadata;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/MediaMetadata$Builder;->dimensions:Lcom/dropbox/core/v2/files/Dimensions;

    iget-object v2, p0, Lcom/dropbox/core/v2/files/MediaMetadata$Builder;->location:Lcom/dropbox/core/v2/files/GpsCoordinates;

    iget-object v3, p0, Lcom/dropbox/core/v2/files/MediaMetadata$Builder;->timeTaken:Ljava/util/Date;

    invoke-direct {v0, v1, v2, v3}, Lcom/dropbox/core/v2/files/MediaMetadata;-><init>(Lcom/dropbox/core/v2/files/Dimensions;Lcom/dropbox/core/v2/files/GpsCoordinates;Ljava/util/Date;)V

    return-object v0
.end method

.method public withDimensions(Lcom/dropbox/core/v2/files/Dimensions;)Lcom/dropbox/core/v2/files/MediaMetadata$Builder;
    .locals 0

    .line 124
    iput-object p1, p0, Lcom/dropbox/core/v2/files/MediaMetadata$Builder;->dimensions:Lcom/dropbox/core/v2/files/Dimensions;

    return-object p0
.end method

.method public withLocation(Lcom/dropbox/core/v2/files/GpsCoordinates;)Lcom/dropbox/core/v2/files/MediaMetadata$Builder;
    .locals 0

    .line 136
    iput-object p1, p0, Lcom/dropbox/core/v2/files/MediaMetadata$Builder;->location:Lcom/dropbox/core/v2/files/GpsCoordinates;

    return-object p0
.end method

.method public withTimeTaken(Ljava/util/Date;)Lcom/dropbox/core/v2/files/MediaMetadata$Builder;
    .locals 0

    .line 148
    invoke-static {p1}, Lcom/dropbox/core/util/LangUtil;->truncateMillis(Ljava/util/Date;)Ljava/util/Date;

    move-result-object p1

    iput-object p1, p0, Lcom/dropbox/core/v2/files/MediaMetadata$Builder;->timeTaken:Ljava/util/Date;

    return-object p0
.end method
