.class Lcom/flyersoft/moonreaderp/PrefOptions$3;
.super Ljava/lang/Object;
.source "PrefOptions.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefOptions;->scrollToTitle(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefOptions;

.field final synthetic val$targetTitle:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefOptions;Ljava/lang/String;)V
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

    .line 254
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefOptions$3;->this$0:Lcom/flyersoft/moonreaderp/PrefOptions;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefOptions$3;->val$targetTitle:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 257
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefOptions$3;->this$0:Lcom/flyersoft/moonreaderp/PrefOptions;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefOptions;->root:Landroid/view/View;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefOptions$3;->val$targetTitle:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->scrollToTitle(Landroid/view/View;Ljava/lang/String;)V

    return-void
.end method
