.class Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1$1;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1;->onClick(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$3:Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 6298
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1$1;->this$3:Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 6301
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1$1;->this$3:Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const-string p2, "delete_catalogs"

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1$1;->this$3:Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1;->val$library:Lcom/flyersoft/opds/OpdsSite;

    iget-object p2, p2, Lcom/flyersoft/opds/OpdsSite;->xmlFile:Ljava/lang/String;

    .line 6302
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-interface {p1, p2, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 6303
    new-instance p1, Ljava/io/File;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v0, Lcom/flyersoft/tools/A;->xml_files_folder:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "/"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1$1;->this$3:Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1;->val$library:Lcom/flyersoft/opds/OpdsSite;

    iget-object v0, v0, Lcom/flyersoft/opds/OpdsSite;->xmlFile:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ".xml"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 6304
    invoke-static {}, Lcom/flyersoft/opds/N;->getLibraries()Ljava/util/ArrayList;

    move-result-object p1

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1$1;->this$3:Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1;->val$library:Lcom/flyersoft/opds/OpdsSite;

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 6305
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1$1;->this$3:Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1$1;->this$3:Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityMain;->netLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->myNotifyDataSetChanged(Landroidx/recyclerview/widget/RecyclerView;)V

    return-void
.end method
