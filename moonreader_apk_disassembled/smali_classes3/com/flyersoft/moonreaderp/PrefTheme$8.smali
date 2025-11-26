.class Lcom/flyersoft/moonreaderp/PrefTheme$8;
.super Ljava/lang/Object;
.source "PrefTheme.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefFilePick$OnGetFile;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefTheme;->doExportTheme()V
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

    .line 629
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$8;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGetFile(Ljava/lang/String;)V
    .locals 1

    .line 632
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme$8;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/PrefTheme;->-$$Nest$mdoExportThemeFinal(Lcom/flyersoft/moonreaderp/PrefTheme;Ljava/lang/String;)V

    .line 633
    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    sput-object p1, Lcom/flyersoft/tools/A;->theme_export_path:Ljava/lang/String;

    return-void
.end method
