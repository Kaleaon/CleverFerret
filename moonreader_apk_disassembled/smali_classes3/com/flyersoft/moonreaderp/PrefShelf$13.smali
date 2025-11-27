.class Lcom/flyersoft/moonreaderp/PrefShelf$13;
.super Ljava/lang/Object;
.source "PrefShelf.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefShelf;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefShelf;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefShelf;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 609
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$13;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 612
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$13;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string v0, "com.flyersoft.moonreaderp"

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->openAppInMarket(Landroid/content/Context;Ljava/lang/String;)Z

    return-void
.end method
