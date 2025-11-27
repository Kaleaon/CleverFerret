.class public Lcom/dropbox/core/v2/files/GpsCoordinates;
.super Ljava/lang/Object;
.source "GpsCoordinates.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/GpsCoordinates$Serializer;
    }
.end annotation


# instance fields
.field protected final latitude:D

.field protected final longitude:D


# direct methods
.method public constructor <init>(DD)V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-wide p1, p0, Lcom/dropbox/core/v2/files/GpsCoordinates;->latitude:D

    .line 36
    iput-wide p3, p0, Lcom/dropbox/core/v2/files/GpsCoordinates;->longitude:D

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 7

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-nez p1, :cond_1

    return v1

    .line 75
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 76
    check-cast p1, Lcom/dropbox/core/v2/files/GpsCoordinates;

    .line 77
    iget-wide v2, p0, Lcom/dropbox/core/v2/files/GpsCoordinates;->latitude:D

    iget-wide v4, p1, Lcom/dropbox/core/v2/files/GpsCoordinates;->latitude:D

    cmpl-double v6, v2, v4

    if-nez v6, :cond_2

    iget-wide v2, p0, Lcom/dropbox/core/v2/files/GpsCoordinates;->longitude:D

    iget-wide v4, p1, Lcom/dropbox/core/v2/files/GpsCoordinates;->longitude:D

    cmpl-double p1, v2, v4

    if-nez p1, :cond_2

    return v0

    :cond_2
    return v1
.end method

.method public getLatitude()D
    .locals 2

    .line 45
    iget-wide v0, p0, Lcom/dropbox/core/v2/files/GpsCoordinates;->latitude:D

    return-wide v0
.end method

.method public getLongitude()D
    .locals 2

    .line 54
    iget-wide v0, p0, Lcom/dropbox/core/v2/files/GpsCoordinates;->longitude:D

    return-wide v0
.end method

.method public hashCode()I
    .locals 4

    .line 59
    iget-wide v0, p0, Lcom/dropbox/core/v2/files/GpsCoordinates;->latitude:D

    .line 60
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iget-wide v1, p0, Lcom/dropbox/core/v2/files/GpsCoordinates;->longitude:D

    .line 61
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    .line 59
    invoke-static {v2}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 88
    sget-object v0, Lcom/dropbox/core/v2/files/GpsCoordinates$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/GpsCoordinates$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/GpsCoordinates$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 100
    sget-object v0, Lcom/dropbox/core/v2/files/GpsCoordinates$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/GpsCoordinates$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/GpsCoordinates$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
