.class Lcom/flyersoft/moonreaderp/PrefShareText$1;
.super Ljava/lang/Object;
.source "PrefShareText.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefShareText;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefShareText;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefShareText;)V
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
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShareText$1;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 113
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText$1;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/PrefShareText;->-$$Nest$mcreateTemplate1(Lcom/flyersoft/moonreaderp/PrefShareText;Z)V

    .line 114
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText$1;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/PrefShareText;->-$$Nest$mcreateTemplate2(Lcom/flyersoft/moonreaderp/PrefShareText;Z)V

    .line 115
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText$1;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/PrefShareText;->-$$Nest$mcreateTemplate3(Lcom/flyersoft/moonreaderp/PrefShareText;Z)V

    .line 116
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText$1;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/PrefShareText;->-$$Nest$mcreateTemplate4(Lcom/flyersoft/moonreaderp/PrefShareText;Z)V

    .line 117
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText$1;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/PrefShareText;->-$$Nest$msetTextSize(Lcom/flyersoft/moonreaderp/PrefShareText;Z)V

    return-void
.end method
