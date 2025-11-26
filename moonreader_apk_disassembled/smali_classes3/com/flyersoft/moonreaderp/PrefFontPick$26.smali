.class Lcom/flyersoft/moonreaderp/PrefFontPick$26;
.super Ljava/lang/Object;
.source "PrefFontPick.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefFolderPick$OnGetFolder;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefFontPick;->doFindFonts()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefFontPick;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 757
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$26;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGetFolder(Ljava/lang/String;)V
    .locals 1

    .line 759
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$26;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefFontPick;->pathEdit:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 760
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$26;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefFontPick;->-$$Nest$mfindFonts(Lcom/flyersoft/moonreaderp/PrefFontPick;)V

    return-void
.end method
