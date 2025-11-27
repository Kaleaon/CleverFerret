.class public Lorg/comic/CLayout$Pos;
.super Ljava/lang/Object;
.source "CLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/comic/CLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Pos"
.end annotation


# instance fields
.field public pageno:I

.field public x:F

.field public y:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 28
    iput v0, p0, Lorg/comic/CLayout$Pos;->x:F

    .line 29
    iput v0, p0, Lorg/comic/CLayout$Pos;->y:F

    const/4 v0, 0x0

    .line 30
    iput v0, p0, Lorg/comic/CLayout$Pos;->pageno:I

    return-void
.end method
