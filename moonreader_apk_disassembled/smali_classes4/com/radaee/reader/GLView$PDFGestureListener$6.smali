.class Lcom/radaee/reader/GLView$PDFGestureListener$6;
.super Ljava/lang/Object;
.source "GLView.java"

# interfaces
.implements Landroid/content/DialogInterface$OnMultiChoiceClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/reader/GLView$PDFGestureListener;->onListAnnot()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/radaee/reader/GLView$PDFGestureListener;


# direct methods
.method constructor <init>(Lcom/radaee/reader/GLView$PDFGestureListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 405
    iput-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener$6;->this$1:Lcom/radaee/reader/GLView$PDFGestureListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;IZ)V
    .locals 0

    .line 408
    iget-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener$6;->this$1:Lcom/radaee/reader/GLView$PDFGestureListener;

    iget-object p1, p1, Lcom/radaee/reader/GLView$PDFGestureListener;->mCheckedItems:[Z

    aput-boolean p3, p1, p2

    return-void
.end method
