.class Lcom/flyersoft/moonreaderp/PrefControl$3;
.super Ljava/lang/Object;
.source "PrefControl.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefControl;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefControl;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefControl;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 110
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefControl$3;->this$0:Lcom/flyersoft/moonreaderp/PrefControl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 112
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefMisc;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl$3;->this$0:Lcom/flyersoft/moonreaderp/PrefControl;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefControl;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefControl$3;->this$0:Lcom/flyersoft/moonreaderp/PrefControl;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefControl;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->status_bar:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p1, v0, v1}, Lcom/flyersoft/moonreaderp/PrefMisc;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefMisc;->show()V

    return-void
.end method
