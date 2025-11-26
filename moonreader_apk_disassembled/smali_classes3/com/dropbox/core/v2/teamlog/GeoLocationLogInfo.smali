.class public Lcom/dropbox/core/v2/teamlog/GeoLocationLogInfo;
.super Ljava/lang/Object;
.source "GeoLocationLogInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/GeoLocationLogInfo$Serializer;,
        Lcom/dropbox/core/v2/teamlog/GeoLocationLogInfo$Builder;
    }
.end annotation


# instance fields
.field protected final city:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final country:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final ipAddress:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final region:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
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

    .line 72
    invoke-direct {p0, p1, v0, v0, v0}, Lcom/dropbox/core/v2/teamlog/GeoLocationLogInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iput-object p2, p0, Lcom/dropbox/core/v2/teamlog/GeoLocationLogInfo;->city:Ljava/lang/String;

    .line 53
    iput-object p3, p0, Lcom/dropbox/core/v2/teamlog/GeoLocationLogInfo;->region:Ljava/lang/String;

    .line 54
    iput-object p4, p0, Lcom/dropbox/core/v2/teamlog/GeoLocationLogInfo;->country:Ljava/lang/String;

    if-eqz p1, :cond_0

    .line 58
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/GeoLocationLogInfo;->ipAddress:Ljava/lang/String;

    return-void

    .line 56
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'ipAddress\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static newBuilder(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/GeoLocationLogInfo$Builder;
    .locals 1

    .line 126
    new-instance v0, Lcom/dropbox/core/v2/teamlog/GeoLocationLogInfo$Builder;

    invoke-direct {v0, p0}, Lcom/dropbox/core/v2/teamlog/GeoLocationLogInfo$Builder;-><init>(Ljava/lang/String;)V

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

    .line 216
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 217
    check-cast p1, Lcom/dropbox/core/v2/teamlog/GeoLocationLogInfo;

    .line 218
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/GeoLocationLogInfo;->ipAddress:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/GeoLocationLogInfo;->ipAddress:Ljava/lang/String;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/GeoLocationLogInfo;->city:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/GeoLocationLogInfo;->city:Ljava/lang/String;

    if-eq v2, v3, :cond_3

    if-eqz v2, :cond_5

    .line 219
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/GeoLocationLogInfo;->region:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/GeoLocationLogInfo;->region:Ljava/lang/String;

    if-eq v2, v3, :cond_4

    if-eqz v2, :cond_5

    .line 220
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/GeoLocationLogInfo;->country:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/GeoLocationLogInfo;->country:Ljava/lang/String;

    if-eq v2, p1, :cond_6

    if-eqz v2, :cond_5

    .line 221
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

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

.method public getCity()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 92
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/GeoLocationLogInfo;->city:Ljava/lang/String;

    return-object v0
.end method

.method public getCountry()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 112
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/GeoLocationLogInfo;->country:Ljava/lang/String;

    return-object v0
.end method

.method public getIpAddress()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 82
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/GeoLocationLogInfo;->ipAddress:Ljava/lang/String;

    return-object v0
.end method

.method public getRegion()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 102
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/GeoLocationLogInfo;->region:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 6

    .line 198
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/GeoLocationLogInfo;->city:Ljava/lang/String;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/GeoLocationLogInfo;->region:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/GeoLocationLogInfo;->country:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/GeoLocationLogInfo;->ipAddress:Ljava/lang/String;

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

    .line 231
    sget-object v0, Lcom/dropbox/core/v2/teamlog/GeoLocationLogInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/GeoLocationLogInfo$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/GeoLocationLogInfo$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 243
    sget-object v0, Lcom/dropbox/core/v2/teamlog/GeoLocationLogInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/GeoLocationLogInfo$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/GeoLocationLogInfo$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
