.class Lcom/flyersoft/moonreaderp/ActivityTxt$170;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->disableFunctionsInWebView(Landroid/view/View;)Z
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

    .line 17276
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$170;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 17278
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$170;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdoChromeButton(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    return-void
.end method
