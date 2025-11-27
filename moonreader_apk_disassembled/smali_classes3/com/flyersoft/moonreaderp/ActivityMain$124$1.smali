.class Lcom/flyersoft/moonreaderp/ActivityMain$124$1;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Lcom/flyersoft/components/MyMenu$MenuItemClick;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$124;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityMain$124;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$124;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 10481
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$124$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$124;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(I)V
    .locals 0

    .line 10483
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$124$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$124;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$124;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mclearAllStatistics(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    return-void
.end method
