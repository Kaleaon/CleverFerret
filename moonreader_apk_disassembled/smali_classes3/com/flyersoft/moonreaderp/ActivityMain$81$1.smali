.class Lcom/flyersoft/moonreaderp/ActivityMain$81$1;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$81;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityMain$81;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$81;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 7402
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$81$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$81;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 7405
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$81$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$81;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$81;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$81$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$81;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain$81;->val$searchKey:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mupdateShelfFinal(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/lang/String;)V

    return-void
.end method
