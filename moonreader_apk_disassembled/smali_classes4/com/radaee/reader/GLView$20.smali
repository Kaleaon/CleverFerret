.class Lcom/radaee/reader/GLView$20;
.super Ljava/lang/Object;
.source "GLView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/reader/GLView;->BundleRestorePos(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/radaee/reader/GLView;

.field final synthetic val$pos:Lcom/radaee/view/GLLayout$PDFPos;


# direct methods
.method constructor <init>(Lcom/radaee/reader/GLView;Lcom/radaee/view/GLLayout$PDFPos;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 2864
    iput-object p1, p0, Lcom/radaee/reader/GLView$20;->this$0:Lcom/radaee/reader/GLView;

    iput-object p2, p0, Lcom/radaee/reader/GLView$20;->val$pos:Lcom/radaee/view/GLLayout$PDFPos;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 2867
    iget-object v0, p0, Lcom/radaee/reader/GLView$20;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/radaee/reader/GLView$20;->val$pos:Lcom/radaee/view/GLLayout$PDFPos;

    invoke-virtual {v0, v1, v1, v2}, Lcom/radaee/view/GLLayout;->vSetPos(IILcom/radaee/view/GLLayout$PDFPos;)V

    .line 2868
    iget-object v0, p0, Lcom/radaee/reader/GLView$20;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->requestRender()V

    return-void
.end method
