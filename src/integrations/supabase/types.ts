export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[]

export type Database = {
  // Allows to automatically instantiate createClient with right options
  // instead of createClient<Database, { PostgrestVersion: 'XX' }>(URL, KEY)
  __InternalSupabase: {
    PostgrestVersion: "12.2.12 (cd3cf9e)"
  }
  public: {
    Tables: {
      chat_messages: {
        Row: {
          created_at: string
          id: string
          is_from_user: boolean
          language: string | null
          message: string
          session_id: string
          user_id: string | null
        }
        Insert: {
          created_at?: string
          id?: string
          is_from_user?: boolean
          language?: string | null
          message: string
          session_id?: string
          user_id?: string | null
        }
        Update: {
          created_at?: string
          id?: string
          is_from_user?: boolean
          language?: string | null
          message?: string
          session_id?: string
          user_id?: string | null
        }
        Relationships: []
      }
      forum_post_likes: {
        Row: {
          created_at: string
          id: string
          post_id: string
          user_id: string
        }
        Insert: {
          created_at?: string
          id?: string
          post_id: string
          user_id: string
        }
        Update: {
          created_at?: string
          id?: string
          post_id?: string
          user_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "forum_post_likes_post_id_fkey"
            columns: ["post_id"]
            isOneToOne: false
            referencedRelation: "forum_posts"
            referencedColumns: ["id"]
          },
        ]
      }
      forum_posts: {
        Row: {
          content: string
          created_at: string
          edited_at: string | null
          id: string
          is_anonymous: boolean | null
          is_edited: boolean | null
          likes_count: number | null
          replies_count: number | null
          search_vector: unknown | null
          title: string | null
          updated_at: string
          user_id: string | null
        }
        Insert: {
          content: string
          created_at?: string
          edited_at?: string | null
          id?: string
          is_anonymous?: boolean | null
          is_edited?: boolean | null
          likes_count?: number | null
          replies_count?: number | null
          search_vector?: unknown | null
          title?: string | null
          updated_at?: string
          user_id?: string | null
        }
        Update: {
          content?: string
          created_at?: string
          edited_at?: string | null
          id?: string
          is_anonymous?: boolean | null
          is_edited?: boolean | null
          likes_count?: number | null
          replies_count?: number | null
          search_vector?: unknown | null
          title?: string | null
          updated_at?: string
          user_id?: string | null
        }
        Relationships: []
      }
      forum_replies: {
        Row: {
          content: string
          created_at: string
          id: string
          is_anonymous: boolean | null
          parent_reply_id: string | null
          post_id: string
          updated_at: string
          user_id: string | null
        }
        Insert: {
          content: string
          created_at?: string
          id?: string
          is_anonymous?: boolean | null
          parent_reply_id?: string | null
          post_id: string
          updated_at?: string
          user_id?: string | null
        }
        Update: {
          content?: string
          created_at?: string
          id?: string
          is_anonymous?: boolean | null
          parent_reply_id?: string | null
          post_id?: string
          updated_at?: string
          user_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "forum_replies_parent_reply_id_fkey"
            columns: ["parent_reply_id"]
            isOneToOne: false
            referencedRelation: "forum_replies"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "forum_replies_post_id_fkey"
            columns: ["post_id"]
            isOneToOne: false
            referencedRelation: "forum_posts"
            referencedColumns: ["id"]
          },
        ]
      }
      profiles: {
        Row: {
          anonymous_by_default: boolean | null
          avatar_url: string | null
          created_at: string
          full_name: string | null
          gender: string | null
          id: string
          location: string | null
          nickname: string | null
          phone: string | null
          profile_picture_url: string | null
          updated_at: string
          uses_avatar: boolean | null
        }
        Insert: {
          anonymous_by_default?: boolean | null
          avatar_url?: string | null
          created_at?: string
          full_name?: string | null
          gender?: string | null
          id: string
          location?: string | null
          nickname?: string | null
          phone?: string | null
          profile_picture_url?: string | null
          updated_at?: string
          uses_avatar?: boolean | null
        }
        Update: {
          anonymous_by_default?: boolean | null
          avatar_url?: string | null
          created_at?: string
          full_name?: string | null
          gender?: string | null
          id?: string
          location?: string | null
          nickname?: string | null
          phone?: string | null
          profile_picture_url?: string | null
          updated_at?: string
          uses_avatar?: boolean | null
        }
        Relationships: []
      }
      search_history: {
        Row: {
          created_at: string | null
          id: string
          search_term: string
          search_type: string
          user_id: string
        }
        Insert: {
          created_at?: string | null
          id?: string
          search_term: string
          search_type: string
          user_id: string
        }
        Update: {
          created_at?: string | null
          id?: string
          search_term?: string
          search_type?: string
          user_id?: string
        }
        Relationships: []
      }
      temp_muganga_survey_responses: {
        Row: {
          communication_preference: string
          cost_feedback: string
          created_at: string
          id: string
          overall_experience: string
          subscription_date: string
          survey_completed_date: string
          therapy_rating: number
          user_id: string
          would_recommend: boolean
        }
        Insert: {
          communication_preference: string
          cost_feedback: string
          created_at?: string
          id?: string
          overall_experience: string
          subscription_date: string
          survey_completed_date?: string
          therapy_rating: number
          user_id: string
          would_recommend: boolean
        }
        Update: {
          communication_preference?: string
          cost_feedback?: string
          created_at?: string
          id?: string
          overall_experience?: string
          subscription_date?: string
          survey_completed_date?: string
          therapy_rating?: number
          user_id?: string
          would_recommend?: boolean
        }
        Relationships: []
      }
      user_preferences: {
        Row: {
          created_at: string | null
          id: string
          lazy_loading_enabled: boolean | null
          low_data_mode: boolean | null
          offline_mode_enabled: boolean | null
          onboarding_completed: boolean | null
          updated_at: string | null
          user_id: string
        }
        Insert: {
          created_at?: string | null
          id?: string
          lazy_loading_enabled?: boolean | null
          low_data_mode?: boolean | null
          offline_mode_enabled?: boolean | null
          onboarding_completed?: boolean | null
          updated_at?: string | null
          user_id: string
        }
        Update: {
          created_at?: string | null
          id?: string
          lazy_loading_enabled?: boolean | null
          low_data_mode?: boolean | null
          offline_mode_enabled?: boolean | null
          onboarding_completed?: boolean | null
          updated_at?: string | null
          user_id?: string
        }
        Relationships: []
      }
    }
    Views: {
      [_ in never]: never
    }
    Functions: {
      [_ in never]: never
    }
    Enums: {
      [_ in never]: never
    }
    CompositeTypes: {
      [_ in never]: never
    }
  }
}

type DatabaseWithoutInternals = Omit<Database, "__InternalSupabase">

type DefaultSchema = DatabaseWithoutInternals[Extract<keyof Database, "public">]

export type Tables<
  DefaultSchemaTableNameOrOptions extends
    | keyof (DefaultSchema["Tables"] & DefaultSchema["Views"])
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof (DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"] &
        DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Views"])
    : never = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? (DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"] &
      DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Views"])[TableName] extends {
      Row: infer R
    }
    ? R
    : never
  : DefaultSchemaTableNameOrOptions extends keyof (DefaultSchema["Tables"] &
        DefaultSchema["Views"])
    ? (DefaultSchema["Tables"] &
        DefaultSchema["Views"])[DefaultSchemaTableNameOrOptions] extends {
        Row: infer R
      }
      ? R
      : never
    : never

export type TablesInsert<
  DefaultSchemaTableNameOrOptions extends
    | keyof DefaultSchema["Tables"]
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Insert: infer I
    }
    ? I
    : never
  : DefaultSchemaTableNameOrOptions extends keyof DefaultSchema["Tables"]
    ? DefaultSchema["Tables"][DefaultSchemaTableNameOrOptions] extends {
        Insert: infer I
      }
      ? I
      : never
    : never

export type TablesUpdate<
  DefaultSchemaTableNameOrOptions extends
    | keyof DefaultSchema["Tables"]
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Update: infer U
    }
    ? U
    : never
  : DefaultSchemaTableNameOrOptions extends keyof DefaultSchema["Tables"]
    ? DefaultSchema["Tables"][DefaultSchemaTableNameOrOptions] extends {
        Update: infer U
      }
      ? U
      : never
    : never

export type Enums<
  DefaultSchemaEnumNameOrOptions extends
    | keyof DefaultSchema["Enums"]
    | { schema: keyof DatabaseWithoutInternals },
  EnumName extends DefaultSchemaEnumNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaEnumNameOrOptions["schema"]]["Enums"]
    : never = never,
> = DefaultSchemaEnumNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[DefaultSchemaEnumNameOrOptions["schema"]]["Enums"][EnumName]
  : DefaultSchemaEnumNameOrOptions extends keyof DefaultSchema["Enums"]
    ? DefaultSchema["Enums"][DefaultSchemaEnumNameOrOptions]
    : never

export type CompositeTypes<
  PublicCompositeTypeNameOrOptions extends
    | keyof DefaultSchema["CompositeTypes"]
    | { schema: keyof DatabaseWithoutInternals },
  CompositeTypeName extends PublicCompositeTypeNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"]
    : never = never,
> = PublicCompositeTypeNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"][CompositeTypeName]
  : PublicCompositeTypeNameOrOptions extends keyof DefaultSchema["CompositeTypes"]
    ? DefaultSchema["CompositeTypes"][PublicCompositeTypeNameOrOptions]
    : never

export const Constants = {
  public: {
    Enums: {},
  },
} as const
