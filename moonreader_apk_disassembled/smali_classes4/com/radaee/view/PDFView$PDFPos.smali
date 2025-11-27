.class public Lcom/radaee/view/PDFView$PDFPos;
.super Ljava/lang/Object;
.source "PDFView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/radaee/view/PDFView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "PDFPos"
.end annotation


# instance fields
.field public pageno:I

.field final synthetic this$0:Lcom/radaee/view/PDFView;

.field public x:F

.field public y:F


# direct methods
.method public constructor <init>(Lcom/radaee/view/PDFView;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 117
    iput-object p1, p0, Lcom/radaee/view/PDFView$PDFPos;->this$0:Lcom/radaee/view/PDFView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
