.class Lcom/flyersoft/moonreaderp/PrefTheme$1$2;
.super Ljava/lang/Object;
.source "PrefTheme.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefTheme$1;->onClick(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefTheme$1;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefTheme$1;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 235
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$1$2;->this$1:Lcom/flyersoft/moonreaderp/PrefTheme$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 237
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$1$2;->this$1:Lcom/flyersoft/moonreaderp/PrefTheme$1;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefTheme$1;->val$selectedTheme:Ljava/lang/String;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->deleteTheme(Ljava/lang/String;)V

    .line 238
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$1$2;->this$1:Lcom/flyersoft/moonreaderp/PrefTheme$1;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefTheme$1;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefTheme;->adapter:Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->notifyDataSetChanged()V

    return-void
.end method
