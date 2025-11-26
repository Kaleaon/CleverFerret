.class Lcom/flyersoft/moonreaderp/PrefTheme$11;
.super Ljava/lang/Object;
.source "PrefTheme.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefFilePick$OnGetFile;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefTheme;->doImportTheme(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefTheme;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefTheme;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 714
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$11;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGetFile(Ljava/lang/String;)V
    .locals 1

    .line 717
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme$11;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefTheme;->prefThemeFilePick:Lcom/flyersoft/moonreaderp/PrefFilePick;

    if-eqz v0, :cond_0

    .line 718
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme$11;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefTheme;->prefThemeFilePick:Lcom/flyersoft/moonreaderp/PrefFilePick;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefFilePick;->dismiss()V

    .line 719
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme$11;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/PrefTheme;->-$$Nest$mdoImportTheme(Lcom/flyersoft/moonreaderp/PrefTheme;Ljava/lang/String;)V

    return-void
.end method
