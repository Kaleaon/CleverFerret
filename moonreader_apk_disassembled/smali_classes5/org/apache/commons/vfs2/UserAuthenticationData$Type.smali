.class public Lorg/apache/commons/vfs2/UserAuthenticationData$Type;
.super Ljava/lang/Object;
.source "UserAuthenticationData.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/vfs2/UserAuthenticationData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Lorg/apache/commons/vfs2/UserAuthenticationData$Type;",
        ">;"
    }
.end annotation


# instance fields
.field private final type:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object p1, p0, Lorg/apache/commons/vfs2/UserAuthenticationData$Type;->type:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 30
    check-cast p1, Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/UserAuthenticationData$Type;->compareTo(Lorg/apache/commons/vfs2/UserAuthenticationData$Type;)I

    move-result p1

    return p1
.end method

.method public compareTo(Lorg/apache/commons/vfs2/UserAuthenticationData$Type;)I
    .locals 1

    .line 63
    iget-object v0, p0, Lorg/apache/commons/vfs2/UserAuthenticationData$Type;->type:Ljava/lang/String;

    iget-object p1, p1, Lorg/apache/commons/vfs2/UserAuthenticationData$Type;->type:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_4

    .line 48
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_1

    .line 52
    :cond_1
    check-cast p1, Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    .line 54
    iget-object v2, p0, Lorg/apache/commons/vfs2/UserAuthenticationData$Type;->type:Ljava/lang/String;

    iget-object p1, p1, Lorg/apache/commons/vfs2/UserAuthenticationData$Type;->type:Ljava/lang/String;

    if-eqz v2, :cond_2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_3

    goto :goto_0

    :cond_2
    if-eqz p1, :cond_3

    :goto_0
    return v1

    :cond_3
    return v0

    :cond_4
    :goto_1
    return v1
.end method

.method public hashCode()I
    .locals 1

    .line 72
    iget-object v0, p0, Lorg/apache/commons/vfs2/UserAuthenticationData$Type;->type:Ljava/lang/String;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 81
    iget-object v0, p0, Lorg/apache/commons/vfs2/UserAuthenticationData$Type;->type:Ljava/lang/String;

    return-object v0
.end method
