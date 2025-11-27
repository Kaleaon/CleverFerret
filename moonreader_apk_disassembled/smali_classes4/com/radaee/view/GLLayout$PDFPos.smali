.class public Lcom/radaee/view/GLLayout$PDFPos;
.super Ljava/lang/Object;
.source "GLLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/radaee/view/GLLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PDFPos"
.end annotation


# instance fields
.field public cindex:I

.field public pageno:I

.field public x:F

.field public y:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 273
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 275
    iput v0, p0, Lcom/radaee/view/GLLayout$PDFPos;->x:F

    .line 276
    iput v0, p0, Lcom/radaee/view/GLLayout$PDFPos;->y:F

    const/4 v0, 0x0

    .line 277
    iput v0, p0, Lcom/radaee/view/GLLayout$PDFPos;->pageno:I

    .line 278
    iput v0, p0, Lcom/radaee/view/GLLayout$PDFPos;->cindex:I

    return-void
.end method
