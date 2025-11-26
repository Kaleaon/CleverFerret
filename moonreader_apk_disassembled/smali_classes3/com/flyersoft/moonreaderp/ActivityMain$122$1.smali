.class Lcom/flyersoft/moonreaderp/ActivityMain$122$1;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$122;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityMain$122;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$122;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 10385
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$122$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$122;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 10388
    const-string p1, "#clear#"

    sput-object p1, Lcom/flyersoft/tools/A;->recent_fav_name:Ljava/lang/String;

    .line 10389
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$122$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$122;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$122;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mcreateFavRvAdapter(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    return-void
.end method
