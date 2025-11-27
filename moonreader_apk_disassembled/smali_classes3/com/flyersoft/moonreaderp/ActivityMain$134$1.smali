.class Lcom/flyersoft/moonreaderp/ActivityMain$134$1;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Lcom/flyersoft/components/MyMenu$MenuItemClick;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$134;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityMain$134;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$134;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 12238
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$134$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$134;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(I)V
    .locals 2

    .line 12240
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$134$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$134;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$134;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->filterColors:[Ljava/lang/String;

    aget-object p1, v0, p1

    .line 12241
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$134$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$134;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$134;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 v1, 0x7

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iput p1, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->filterColor:I

    .line 12242
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$134$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$134;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$134;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->refreshAnnotList()V

    .line 12243
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$134$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$134;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$134;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 v0, 0x1

    iput-boolean v0, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->annotUpdated:Z

    return-void
.end method
