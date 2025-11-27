.class Lcom/radaee/reader/PDFLayoutView$PDFGestureListener$8;
.super Ljava/lang/Object;
.source "PDFLayoutView.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->handleSignatureField()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;


# direct methods
.method constructor <init>(Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 470
    iput-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener$8;->this$1:Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 473
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener$8;->this$1:Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;

    const/4 p2, 0x0

    const/4 v0, 0x1

    invoke-static {p1, p2, v0}, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->access$1000(Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;Landroid/graphics/Bitmap;Z)V

    return-void
.end method
