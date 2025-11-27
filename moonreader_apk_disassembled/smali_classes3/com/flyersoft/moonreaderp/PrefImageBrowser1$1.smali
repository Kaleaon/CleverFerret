.class Lcom/flyersoft/moonreaderp/PrefImageBrowser1$1;
.super Ljava/lang/Object;
.source "PrefImageBrowser1.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefImageBrowser1;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 87
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$1;->this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 90
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$1;->this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->-$$Nest$mdoFindImages(Lcom/flyersoft/moonreaderp/PrefImageBrowser1;)V

    return-void
.end method
