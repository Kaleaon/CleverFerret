.class Lcom/flyersoft/moonreaderp/PrefTheme$9;
.super Ljava/lang/Object;
.source "PrefTheme.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefTheme;->doExportThemeFinal(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

.field final synthetic val$toFile:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefTheme;Ljava/lang/String;)V
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

    .line 683
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$9;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefTheme$9;->val$toFile:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 686
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$9;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefTheme;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefTheme$9;->val$toFile:Ljava/lang/String;

    invoke-static {p1, p2}, Lcom/flyersoft/tools/A;->sendFile(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method
