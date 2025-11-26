.class Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;
.super Ljava/lang/Object;
.source "ActivityMain.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Import_Item"
.end annotation


# instance fields
.field broken:Z

.field day:J

.field fileSize:J

.field fileTime:J

.field filename:Ljava/lang/String;

.field imported:Z

.field isFolder:Z

.field onlyFilename:Ljava/lang/String;

.field path:Ljava/lang/String;

.field selected:Z

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

    .line 11679
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
