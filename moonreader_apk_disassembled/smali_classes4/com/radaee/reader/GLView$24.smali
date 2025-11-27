.class Lcom/radaee/reader/GLView$24;
.super Ljava/lang/Object;
.source "GLView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/reader/GLView;->PDFSetPos(Lcom/radaee/view/GLLayout$PDFPos;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/radaee/reader/GLView;

.field final synthetic val$pos:Lcom/radaee/view/GLLayout$PDFPos;

.field final synthetic val$x:I

.field final synthetic val$y:I


# direct methods
.method constructor <init>(Lcom/radaee/reader/GLView;IILcom/radaee/view/GLLayout$PDFPos;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 3082
    iput-object p1, p0, Lcom/radaee/reader/GLView$24;->this$0:Lcom/radaee/reader/GLView;

    iput p2, p0, Lcom/radaee/reader/GLView$24;->val$x:I

    iput p3, p0, Lcom/radaee/reader/GLView$24;->val$y:I

    iput-object p4, p0, Lcom/radaee/reader/GLView$24;->val$pos:Lcom/radaee/view/GLLayout$PDFPos;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 3085
    iget-object v0, p0, Lcom/radaee/reader/GLView$24;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget v1, p0, Lcom/radaee/reader/GLView$24;->val$x:I

    iget v2, p0, Lcom/radaee/reader/GLView$24;->val$y:I

    iget-object v3, p0, Lcom/radaee/reader/GLView$24;->val$pos:Lcom/radaee/view/GLLayout$PDFPos;

    invoke-virtual {v0, v1, v2, v3}, Lcom/radaee/view/GLLayout;->vSetPos(IILcom/radaee/view/GLLayout$PDFPos;)V

    .line 3086
    iget-object v0, p0, Lcom/radaee/reader/GLView$24;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->requestRender()V

    return-void
.end method
