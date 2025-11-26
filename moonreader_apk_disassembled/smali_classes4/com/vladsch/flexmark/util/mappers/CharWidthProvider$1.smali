.class final Lcom/vladsch/flexmark/util/mappers/CharWidthProvider$1;
.super Ljava/lang/Object;
.source "CharWidthProvider.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/mappers/CharWidthProvider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/util/mappers/CharWidthProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public charWidth(C)I
    .locals 0

    const/4 p1, 0x1

    return p1
.end method

.method public charWidth(Ljava/lang/CharSequence;)I
    .locals 0

    .line 21
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p1

    return p1
.end method

.method public spaceWidth()I
    .locals 1

    const/4 v0, 0x1

    return v0
.end method
