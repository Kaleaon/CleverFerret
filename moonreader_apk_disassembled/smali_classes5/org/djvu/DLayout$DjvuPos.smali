.class public Lorg/djvu/DLayout$DjvuPos;
.super Ljava/lang/Object;
.source "DLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/djvu/DLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DjvuPos"
.end annotation


# instance fields
.field public cindex:I

.field public pageno:I

.field public x:F

.field public y:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 24
    iput v0, p0, Lorg/djvu/DLayout$DjvuPos;->x:F

    .line 25
    iput v0, p0, Lorg/djvu/DLayout$DjvuPos;->y:F

    const/4 v0, 0x0

    .line 26
    iput v0, p0, Lorg/djvu/DLayout$DjvuPos;->pageno:I

    .line 27
    iput v0, p0, Lorg/djvu/DLayout$DjvuPos;->cindex:I

    return-void
.end method
