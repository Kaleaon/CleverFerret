.class Lcom/flyersoft/moonreaderp/ActivityTxt$173;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->txtViewSetText(Ljava/lang/CharSequence;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 17657
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$173;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 17661
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$173;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getHeight()I

    move-result v0

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$173;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getHeight()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 17662
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$173;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$173;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getHeight()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/flyersoft/staticlayout/MRTextView;->setForceHeight(I)V

    .line 17663
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$173;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->postInvalidate()V

    return-void

    .line 17664
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$173;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getHeight()I

    move-result v0

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$173;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getHeight()I

    move-result v1

    if-le v0, v1, :cond_1

    .line 17665
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$173;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$173;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getHeight()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/flyersoft/staticlayout/MRTextView;->setForceHeight(I)V

    .line 17666
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$173;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->postInvalidate()V

    :cond_1
    return-void
.end method
