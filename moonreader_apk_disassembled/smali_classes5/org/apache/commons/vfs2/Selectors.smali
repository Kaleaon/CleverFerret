.class public final Lorg/apache/commons/vfs2/Selectors;
.super Ljava/lang/Object;
.source "Selectors.java"


# static fields
.field public static final EXCLUDE_SELF:Lorg/apache/commons/vfs2/FileSelector;

.field public static final SELECT_ALL:Lorg/apache/commons/vfs2/FileSelector;

.field public static final SELECT_CHILDREN:Lorg/apache/commons/vfs2/FileSelector;

.field public static final SELECT_FILES:Lorg/apache/commons/vfs2/FileSelector;

.field public static final SELECT_FOLDERS:Lorg/apache/commons/vfs2/FileSelector;

.field public static final SELECT_SELF:Lorg/apache/commons/vfs2/FileSelector;

.field public static final SELECT_SELF_AND_CHILDREN:Lorg/apache/commons/vfs2/FileSelector;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 26
    new-instance v0, Lorg/apache/commons/vfs2/FileDepthSelector;

    invoke-direct {v0}, Lorg/apache/commons/vfs2/FileDepthSelector;-><init>()V

    sput-object v0, Lorg/apache/commons/vfs2/Selectors;->SELECT_SELF:Lorg/apache/commons/vfs2/FileSelector;

    .line 31
    new-instance v0, Lorg/apache/commons/vfs2/FileDepthSelector;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/vfs2/FileDepthSelector;-><init>(II)V

    sput-object v0, Lorg/apache/commons/vfs2/Selectors;->SELECT_SELF_AND_CHILDREN:Lorg/apache/commons/vfs2/FileSelector;

    .line 36
    new-instance v0, Lorg/apache/commons/vfs2/FileDepthSelector;

    invoke-direct {v0, v2}, Lorg/apache/commons/vfs2/FileDepthSelector;-><init>(I)V

    sput-object v0, Lorg/apache/commons/vfs2/Selectors;->SELECT_CHILDREN:Lorg/apache/commons/vfs2/FileSelector;

    .line 42
    new-instance v0, Lorg/apache/commons/vfs2/FileDepthSelector;

    const v1, 0x7fffffff

    invoke-direct {v0, v2, v1}, Lorg/apache/commons/vfs2/FileDepthSelector;-><init>(II)V

    sput-object v0, Lorg/apache/commons/vfs2/Selectors;->EXCLUDE_SELF:Lorg/apache/commons/vfs2/FileSelector;

    .line 47
    new-instance v0, Lorg/apache/commons/vfs2/FileTypeSelector;

    sget-object v1, Lorg/apache/commons/vfs2/FileType;->FILE:Lorg/apache/commons/vfs2/FileType;

    invoke-direct {v0, v1}, Lorg/apache/commons/vfs2/FileTypeSelector;-><init>(Lorg/apache/commons/vfs2/FileType;)V

    sput-object v0, Lorg/apache/commons/vfs2/Selectors;->SELECT_FILES:Lorg/apache/commons/vfs2/FileSelector;

    .line 52
    new-instance v0, Lorg/apache/commons/vfs2/FileTypeSelector;

    sget-object v1, Lorg/apache/commons/vfs2/FileType;->FOLDER:Lorg/apache/commons/vfs2/FileType;

    invoke-direct {v0, v1}, Lorg/apache/commons/vfs2/FileTypeSelector;-><init>(Lorg/apache/commons/vfs2/FileType;)V

    sput-object v0, Lorg/apache/commons/vfs2/Selectors;->SELECT_FOLDERS:Lorg/apache/commons/vfs2/FileSelector;

    .line 57
    new-instance v0, Lorg/apache/commons/vfs2/AllFileSelector;

    invoke-direct {v0}, Lorg/apache/commons/vfs2/AllFileSelector;-><init>()V

    sput-object v0, Lorg/apache/commons/vfs2/Selectors;->SELECT_ALL:Lorg/apache/commons/vfs2/FileSelector;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
