.class Lcom/flyersoft/moonreaderp/PrefFontPick$5$1;
.super Ljava/lang/Object;
.source "PrefFontPick.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefFolderPick$OnGetFolder;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefFontPick$5;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefFontPick$5;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefFontPick$5;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 162
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$5$1;->this$1:Lcom/flyersoft/moonreaderp/PrefFontPick$5;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGetFolder(Ljava/lang/String;)V
    .locals 1

    .line 165
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$5$1;->this$1:Lcom/flyersoft/moonreaderp/PrefFontPick$5;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefFontPick$5;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefFontPick;->pathEdit:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 166
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$5$1;->this$1:Lcom/flyersoft/moonreaderp/PrefFontPick$5;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefFontPick$5;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefFontPick;->-$$Nest$mfindFonts(Lcom/flyersoft/moonreaderp/PrefFontPick;)V

    return-void
.end method
