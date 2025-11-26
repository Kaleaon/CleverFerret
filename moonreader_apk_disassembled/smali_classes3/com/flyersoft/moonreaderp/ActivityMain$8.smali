.class Lcom/flyersoft/moonreaderp/ActivityMain$8;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->show_main_files(Z)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 937
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$8;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 940
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->string2Int(Ljava/lang/String;)I

    move-result p1

    .line 941
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$8;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mshowFileSearchResult(Lcom/flyersoft/moonreaderp/ActivityMain;I)V

    return-void
.end method
