.class public Lcom/radaee/view/PDFLayout$PDFPos;
.super Ljava/lang/Object;
.source "PDFLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/radaee/view/PDFLayout;
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

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 22
    iput v0, p0, Lcom/radaee/view/PDFLayout$PDFPos;->x:F

    .line 23
    iput v0, p0, Lcom/radaee/view/PDFLayout$PDFPos;->y:F

    const/4 v0, 0x0

    .line 24
    iput v0, p0, Lcom/radaee/view/PDFLayout$PDFPos;->pageno:I

    .line 25
    iput v0, p0, Lcom/radaee/view/PDFLayout$PDFPos;->cindex:I

    return-void
.end method
